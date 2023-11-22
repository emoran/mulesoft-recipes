# Idempotent Filter


The Mule 4 Idempotent Filter is a powerful tool that can be used to prevent duplicate messages from being processed. This can be useful in a variety of scenarios, such as when processing orders, financial transactions, or other sensitive data.

The Idempotent Filter works by checking the incoming message for a unique identifier. This identifier can be any attribute of the message, or it can be computed using a DataWeave expression. The filter then checks to see if this identifier has already been processed. If it has, the message is discarded. Otherwise, the message is allowed to continue through the flow.

<img width="430" alt="Screenshot 2023-11-22 at 6 51 35 PM" src="https://github.com/emoran/mulesoft-recipes/assets/1028534/5863a0f0-1a81-49c2-9c5b-f8fedd892352">


The Idempotent Filter can be configured to use a variety of different object stores to store the processed message IDs. This allows you to choose the object store that best meets your needs, such as a local database, a distributed cache, or even a cloud-based object store.

Since the Idempotent filter relies on an Object Store, we need to setup an Object Store connector (No persistent) and for this will tell OS to keep the unique identifier (in this case the incoming phone number) only for three seconds, this way after that time we should be able to keep conversations or any other request going, usually an spam message uses an automated way to send hundreds of messages in parallel.

<img width="736" alt="Screenshot 2023-11-22 at 6 52 24 PM" src="https://github.com/emoran/mulesoft-recipes/assets/1028534/def6da30-4305-4d75-9906-d1b3d091014f">


Read the full article at: https://medium.com/@yucelmoran/using-idempotent-filter-to-avoid-duplicate-request-filter-spam-requests-in-mule-4-27946d31fc3d
