#include <stdio.h>
#include <stdlib.h>

// Node structure
struct Node {
    int data;
    struct Node* next;
};

// Function to create a new node
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->next = NULL;
    return newNode;
}

// Insert at beginning
void insertAtBeginning(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    newNode->next = *head;
    *head = newNode;
    printf("Inserted %d at beginning\n", data);
}

// Insert at end
void insertAtEnd(struct Node** head, int data) {
    struct Node* newNode = createNode(data);
    
    if (*head == NULL) {
        *head = newNode;
        printf("Inserted %d at end\n", data);
        return;
    }
    
    struct Node* temp = *head;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = newNode;
    printf("Inserted %d at end\n", data);
}

// Delete a node
void deleteNode(struct Node** head, int key) {
    struct Node* temp = *head;
    struct Node* prev = NULL;
    
    if (temp != NULL && temp->data == key) {
        *head = temp->next;
        free(temp);
        printf("Deleted %d\n", key);
        return;
    }
    
    while (temp != NULL && temp->data != key) {
        prev = temp;
        temp = temp->next;
    }
    
    if (temp == NULL) {
        printf("Node with value %d not found\n", key);
        return;
    }
    
    prev->next = temp->next;
    free(temp);
    printf("Deleted %d\n", key);
}

// Search for a node
int search(struct Node* head, int key) {
    struct Node* temp = head;
    int position = 0;
    
    while (temp != NULL) {
        if (temp->data == key) {
            return position;
        }
        temp = temp->next;
        position++;
    }
    return -1;
}

// Display the linked list
void display(struct Node* head) {
    if (head == NULL) {
        printf("List is empty\n");
        return;
    }
    
    struct Node* temp = head;
    printf("Linked List: ");
    while (temp != NULL) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

// Count nodes
int countNodes(struct Node* head) {
    int count = 0;
    struct Node* temp = head;
    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}

// Free the linked list
void freeList(struct Node** head) {
    struct Node* temp = *head;
    struct Node* next;
    
    while (temp != NULL) {
        next = temp->next;
        free(temp);
        temp = next;
    }
    *head = NULL;
}

// Main function
int main() {
    struct Node* head = NULL;
    
    printf("=================================\n");
    printf("  Singly Linked List in Docker\n");
    printf("=================================\n\n");
    
    // Insert elements
    insertAtEnd(&head, 10);
    insertAtEnd(&head, 20);
    insertAtEnd(&head, 30);
    insertAtBeginning(&head, 5);
    insertAtEnd(&head, 40);
    
    printf("\n");
    display(head);
    printf("Total nodes: %d\n\n", countNodes(head));
    
    // Search
    int searchKey = 20;
    int pos = search(head, searchKey);
    if (pos != -1) {
        printf("Element %d found at position %d\n\n", searchKey, pos);
    } else {
        printf("Element %d not found\n\n", searchKey);
    }
    
    // Delete
    deleteNode(&head, 20);
    printf("\n");
    display(head);
    printf("Total nodes: %d\n\n", countNodes(head));
    
    // Free memory
    freeList(&head);
    printf("Memory freed. List cleared.\n");
    
    return 0;
}
