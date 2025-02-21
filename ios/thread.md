# Thread
- Documentation / [Thread](https://developer.apple.com/documentation/foundation/thread)
- pointfree / [Concurrency's Past: Threads](https://www.pointfree.co/collections/concurrency/threads-queues-and-tasks/ep190-concurrency-s-past-threads)

#### Priority

- supports setting priority
  - values between 0.0 & 1.0_

#### Cancellation

- _threads not forcibly terminated, only flips the boolean `isCancelled` property_

#### Thread Dictionaries

- _allows setting arbitary values on threads_

#### Problems: coordination

- _child threads do not inherit parent's state like threadDictionary, cancellation, prority etc_

## Resources
- [Operating Systems / Part II Concurrency & Threads](https://github.com/mobiledge/operating-systems/blob/main/README.md#part-ii-concurrency--threads)
- [Example of starting a thread in C](https://claude.site/artifacts/c0bd23a8-274c-472e-9a6f-6b3136fd0896)
- [Example of starting a thread in Java](https://claude.site/artifacts/8295acab-819b-4f63-8b62-6469f38fb4eb)
