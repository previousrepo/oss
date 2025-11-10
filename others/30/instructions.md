# Question 30: Containerized C Program - Singly Linked List

## Build and Run

```bash
cd others/30

# Build the Docker image
docker build -t c-linked-list .

# Run the container
docker run --rm c-linked-list

# Run with interactive mode
docker run -it --rm c-linked-list bash
```

## Compile and Run Manually

```bash
# Enter container
docker run -it --rm gcc:latest bash

# Inside container
cd /tmp
cat > linked_list.c << 'EOF'
[paste the C code]
EOF

gcc -o linked_list linked_list.c
./linked_list
```

## Features Demonstrated

- Insert at beginning
- Insert at end
- Delete node
- Search for element
- Display list
- Count nodes
- Memory management

## Clean Up

```bash
docker rmi c-linked-list
```

## Output Example

```
=================================
  Singly Linked List in Docker
=================================

Inserted 10 at end
Inserted 20 at end
Inserted 30 at end
Inserted 5 at beginning
Inserted 40 at end

Linked List: 5 -> 10 -> 20 -> 30 -> 40 -> NULL
Total nodes: 5

Element 20 found at position 2

Deleted 20

Linked List: 5 -> 10 -> 30 -> 40 -> NULL
Total nodes: 4

Memory freed. List cleared.
```
