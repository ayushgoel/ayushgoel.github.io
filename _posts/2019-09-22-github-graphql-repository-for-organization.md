---
tags: github graphql repo organization
---

GraphQl query to get all repos for an organization is:

{% highlight graphql %}
{
  organization(login: ORGANIZATION_NAME) {
    repositories(first: 100, privacy: PRIVATE, orderBy: {field: CREATED_AT, direction: ASC}) {
      edges {
        node {
          name
          description
          diskUsage
          url
          sshUrl
          isFork
          isPrivate
        }
        cursor
      }
    }
  }
}

{% endhighlight %}

Check [repository fields](https://developer.github.com/v4/object/repository/#fields) to check what all more fields you can get for all repositories.

This query will get you **first 100** repositories ordered by creation date.

To get more, you can use the cursor that is returned response in following query:

{% highlight graphql %}
query ($cur: String) {
  organization(login: ORGANIZATION_NAME) {
    repositories(first: 100, after: $cur privacy: PRIVATE, orderBy: {field: CREATED_AT, direction: ASC}) {
      edges {
        node {
          name
          description
          diskUsage
          url
          sshUrl
          isFork
          isPrivate
        }
        cursor
      }
    }
  }
}

{% endhighlight %}

I used python script to iteratively request all repositories and write to files:

{% highlight python %}
import requests
import json

url = "https://api.github.com/graphql"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Bearer <token>",
    'Accept': "*/*",
    'Cache-Control': "no-cache",
    'Host': "api.github.com",
    'Accept-Encoding': "gzip, deflate",
    'Connection': "keep-alive",
    'cache-control': "no-cache"
    }

q1 = """
{
  organization(login: ORGANIZATION_NAME) {
    repositories(first: 100, privacy: PRIVATE, orderBy: {field: CREATED_AT, direction: ASC}) {
      edges {
        node {
          name
          description
          diskUsage
          url
          sshUrl
          isFork
          isPrivate
        }
        cursor
      }
    }
  }
}
"""

q2 = """
query ($cur: String) {
  organization(login: ORGANIZATION_NAME) {
    repositories(first: 100, after: $cur privacy: PRIVATE, orderBy: {field: CREATED_AT, direction: ASC}) {
      edges {
        node {
          name
          description
          diskUsage
          url
          sshUrl
          isFork
          isPrivate
        }
        cursor
      }
    }
  }
}
"""

def get_repos(cursor = None):
    payload = None
    if cursor is None:
        payload = {"query": q1}
    else:
        payload = {"query": q2, "variables": {"cur": cursor}}
    print(payload)

    response = requests.post(url, json=payload, headers=headers)
    print("Got status code for", response.status_code, response.json())
    return response.json()

def main():
    count = 1
    cursor = None
    while True:
        print("Going with count", count)
        res = get_repos(cursor)
        with open('response' + str(count) + ".json", 'w') as f:
            json.dump(res, f)
        cursor = res["data"]["organization"]["repositories"]["edges"][0]["cursor"]
        count += 1

if __name__ == '__main__':
    main()

{% endhighlight %}

This creates multiple files with responses from Github until response has no results.

