# Read Supervision

## Start and shutdown

- When the supervisor starts, it traverses all child specs and then starts each child in the order they are defined

![Clean-Shot-2024-05-04-at-09-33-32-2x](https://i.ibb.co/KGnj4n9/Clean-Shot-2024-05-04-at-09-33-32-2x.png)

- The startup is asynchronous, meaning one process (including nay children) will finish coming up before another starts

## Life cycle policy
- start up order
- shutdown order
- shutdown policy
- restart policy