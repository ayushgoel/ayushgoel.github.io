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
2. Parking spaces are marked for cars, bikes etc.
3. Special provisioned parking spaces for handicapped. These spaces can not be allotted to general people.

Bonus discussion
---

This parking lot software can be provided as a service. The data can be sharded based on the parking lot location i.e. a parking lot has it's own service running. This allows the service to be blazingly fast with very small databases (a 5K space lot will have <100 MB db>). The servers can still be multi-tenant i.e. multiple processes for different lots can be running on same machines.

To increase availability, N parking lot processes can be distributed over N (or more) machines. For eg, 3 lots A, B, C will all run on 3 different machines fronted by a load balancer.

A B C
B C A
C A B