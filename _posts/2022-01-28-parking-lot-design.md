---
tags: design object-oriented
title: Design a Parking
---

This is a frequent interview question asked at companies like Amazon, Google, Microsoft etc. The question allows the interviewer to judge the interviewee on their low level design skills and even check their coding skills if required.

Note that NOT all design principles are correct at all times. For eg, database denormalization is not considered a good practice, but it [helps improve performance](https://en.wikipedia.org/wiki/Denormalization)

Problem statement
---

Design a parking lot with requirements like:

1. Parking lot has many parking spaces.
2. Parking lot can have multiple floors.
3. Parking spaces are marked for cars, bikes etc.
4. Special provisioned parking spaces for handicapped. These spaces can not be allotted to general people.
5. parking has multiple entry and exit doors.
6. Payment to be done on exit door based on time spent in the parking.
7. Parking charges calculated per hour.
8. In case the parking is full, car should be denied entry. An appropriate error message should be shown.

Key observations:
---

1. Multiple entry and exit doors means the doors are clients to our service and we can not keep any system state at the doors.
2. Though the charges calculation is kept simpler in requirements, the design should allow swift changes to that logic. We should not need to redesign if the business requires us to make changes to charges calculation.
3. At entry, the customer needs to provide us (1) vehicle type and (2) is handicapped, to find an appropriate place in the parking. We may suggest some smart ways to figure out (1), but (2) remains a user input. For (1), vehicle image processing or number plate parsing can be used.

Creating initial Outline
---

First let's start by creating a list of items we need to model in our design.

1. ParkingLot
2. ParkingSpace

ParkingLot ->> ParkingSpace
i.e. ParkingLot will contain multiple instances of ParkingSpace.

MetaData in ParkingSpace:

1. isOccupied - Bool
2. id - Number
3. address - String
4. type - enum [car, bike]
5. forSpeciallyAbled - Bool

Behaviour of ParkingLot:

1. emptySpaces(ParkingSpace.type) -> Number - used to display status of Parking.
2. findSpace(ParkingSpace.type, isHandicapped) -> ParkingSpace - used for booking.

Behaviour of ParkingSpace:

1. Occupy() - occupy space
2. Release() - unoccupy space
3. Address() - printable location of the space

Client aka entry/exit points
---

The gates will act as clients to our service. They would need to know the endpoint for their parking lot and a way to authenticate themselves to the server.
Once the gate-operation starts, it would use our API to connect to the backend and run the parking lot.

API
---

The connection would be secured by TLS and we can optionally ship the server's certificate with the client for a [0-RTT connection](https://www.google.com/search?q=0+rtt).

Creating a Service
---

This parking lot software will be provided as a service. The data can be sharded based on the parking lot location i.e. a parking lot has it's own service running.

1. This allows the service to be blazingly fast with very small databases (a 5K space lot will have <100 MB db).
2. Very easy to run A/B testing.
3. Upgrades and general maintenance would be easy as the services for different parking lots would run independently.
4. The servers can still be multi-tenant i.e. multiple processes for different lots can be running on same machines.

To increase availability, N parking lot processes can be distributed over N (or more) machines. For eg, 3 lots A, B, C will all run on 3 different machines fronted by a load balancer.

A B C
B C A
C A B

Database
---

Since the amount of data is expected to be very low (<100 Mb), we can choose to keep the whole data in memory.
We can setup a event pipeline system like Kafka and submit any changes there. The events from the pipeline will then be pushed to monitoring, logs, metrics etc systems.

For a 500 GB memory system, we should be able to run 1000 parking lots with 400% leeway for memory increase.

### Alternative

Since we want to run the process for a single parking lot on multiple boxes, it would be prudent to run the database separately. We can got with a NoSQL database mapping the entities discussed already - ParkingLot and ParkingSpace.

Using a NoSQL database like MongoDB or CouchDB would allow us to shard the data based on the parking lot it is serving. So a single distributed database would be able to handle all requirements for our service.

Conclusion
---

Some interviewers may focus on one of the entities defined above and dive into implementation for the same. The discussion on scaling the service itself can take a lot of time.

Note to self: in system design, we should focus on one solution instead of providing alternatives. Whatever scales best!
