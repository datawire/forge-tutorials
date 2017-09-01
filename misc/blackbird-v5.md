# Background

In mature microservices organizations, individual developers and teams have very tight feedback loops with their end users. These tight feedback loops enable software to iterate very quickly in response to real-world usage.

# 35,000 foot view

Traditional organizations use centralized systems, processes, and knowledge to deliver software. This approach encourages specialists (operations, QA, release, development) to maximize throughput through the development cycle.

In a microservices organization, the centralized approach results in bottlenecks. For example, a microservices team that relies on operations to create a new database instance must wait for operations.

Instead, we need to do the opposite: we need to support decentralized development. This means we need a system that supports two key principles:

1. Self-sufficiency. Each team needs to be self-sufficient in all aspects of the development cycle to avoid unnecessary bottlenecks.

2. Safety. Since each team cannot be expected to have the same deep expertise as specialists, teams need to be able to run the entire development cycle in such a way that errors do not result in catastrophic failure.

# An example

A single developer (or team) should be able to:

1. Make some code updates to a service
2. Push the code update to production, provisioning whatever resources (databases, compute, network) necessary to run the code update
3. Route a small percentage of traffic to the new version (canary)
4. See the impact of that code change on the service and application (e.g., throughput, latency, availability)
5. Rollback or increase the amount of traffic to the new version as more confidence is gained in the new version

*without* requiring anyone else.

# The 25,000 foot view: A developer platform

In order for a developer (or team) to be safely self-sufficient, the developer needs the right tools. This set of tools consists of three main components that work together:

1. A Layer 7 proxy. Since communication between services and end users happen at L7, it's critical to be able to manage and observe L7 traffic.
2. A development environment. The developer needs a way to develop and deploy code, as well as manage operational infrastructure such as the L7 proxy and Kubernetes, in a way that's idiomatic to the development process.
3. A control plane/dashboard. The control plane operates in real-time, and tells the developer when a code change is adversely impacting the application and gives the developer the information and controls to quickly address the situation.

Together, a platform with these components, plus Kubernetes, can give developers the ability to be safely self-sufficient.

# Blackbird

Blackbird is an open source platform for developing microservices on Kubernetes. Blackbird uses Envoy as the L7 proxy, and adds a local development environment and control plane/dashboard.

Blackbird's goal is to enable microservice teams to have fast development workflows. We see microservices being developed in three different stages:

## Stage 1: Rapid development

Initially, a service is in the rapid development phase, as a developer quickly adds the basic functionality necessary for the service to be useful. In this mode, the important areas for a fast feedback cycle include:

* see the effect of a code change as quickly as possible (e.g., hot reload)
* dev environment that is as identical as possible to production, to eliminate environment-specific bugs

Blackbird accomplishes this with Forge and Telepresence.

* Forge insures environmental parity by standardizing the environment setup & deployment operation
* Telepresence enables an instant feedback cycle on new code

## Stage 2: Running in production (actual users)

Once a service acquires users, a developer still needs to iterate quickly, but cannot negatively impact users. In this world, it becomes important to minimize the impact of a code change on end users. This adds three additional requirements:

* A way to incrementally roll out new code changes to end users
* A way to measure the impact of those code changes on end users
* A way to quickly roll back any bad code changes to end users

Blackbird accomplishes this with Forge, Ambassador, and the control plane.

* Ambassador supports fine-grained canary rollout/rollback to new versions of a service
* Ambassador provides L7 observability of your service's throughput, latency, and availability
* Forge integrates the deployment of the service with Ambassador, with default configuration of the monitoring
* The control plane provides a UI (ChatOps or web UI) to control and monitor the canary rollout

## Stage 3: Internal users

At some point, an application may consist of a deep topology of multiple microservice. When a single microservice has many other dependent services, avoiding cascade failure becomes an additional requirement.

Blackbird plans to support this through additional use of Envoy.

# Working together

The Datawire team is actively working on the local development environment (Forge, Telepresence) and L7 router (Ambassador/Envoy). We'd love to collaborate with the InVision team on any/all aspects of the platform.

One possible way to get our collaboration started is for the InVision team to pick one of our existing solutions (Forge, Telepresence, Ambassador/Envoy), and work with us to roll it out to InVision developers working on v7. We would expect that this effort would result in a set of emergent requirements from InVision developers that we could then tackle as part of the collaboration.

# Pricing

In the interests of full transparency, Datawire plans on commercializing the work. Our current plan is to split commercial and free offerings as follows.

| Free/OSS                                     | Commercial / Not OSS      |
| ---------------------------------------------|---------------------------|
| Local dev env                                | Control plane (SAAS?)     |
| Add-on ops infrastructure (e.g., Ambassador) | Support for entire platform    |

Pricing would be based on an operational usage metric, e.g., # nodes in production, total # of sessions, etc.
