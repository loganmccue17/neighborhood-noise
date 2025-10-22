[HEART Framework Google Slide](https://docs.google.com/presentation/d/11cu22YObNyXOa9RklDN5qmV9LAiE2XLkWEyBcy0Opxg/edit?slide=id.gc8216bd24_20_0#slide=id.gc8216bd24_20_0)

## Happiness

## Engagement
- The average number of times our app was visited by a user in a designated period of time can be accessed directly in Firebase Analytics.
- The average amount of time per session per user spent on our app can also be located in Firebase Analytics.
- We will collect the amount of times that users click to like a post on band's pages.
- We will also collect the amount of views per venue posting on our app.
  -These two metrics will be collected through custom actions in our app that update a number on the backend to track the metric.
-We will also collect a number that is the average of followed bands per user. This will be a good way to detect how many users are actively going through the band searching process as well as successfuly finding bands through our app. 
## Adoption
 - '#' of new registered users - In a Database that holds amount of all registered users for each month, in the current month tick up by 1 the amount of users

 - '#' of new band accounts - In a Database that holds amount of registered band accounts for each month, in the current month tick up by 1 the amount of band accounts

 - % of new users who complete onboarding - In a Database that holds amount of onboarded users, tick up by one once the user finishes creating their profile, compare this amount with the total amount of users, can divide this by month or leave as a total number

## Retention

- Metric 1 – Weekly/Monthly Active Users (WAU/MAU)

Use Firebase Analytics to log user_active events on each app open; query distinct user_ids active in the past 7 or 30 days via BigQuery export.

- Metric 2 – % of Bands Posting >1 Event per Month

Store event posts in Firestore under each band_id; use a scheduled Cloud Function to count bands with >1 event created in the current month and divide by total active bands.

- Metric 3 – 30-Day Retention Rate

Track sign_up and user_active events in Firebase Analytics; use BigQuery to calculate % of users who triggered user_active within 30 days of their sign_up event.

- Metric 4 – # of Likes on the App in Total per Week

Log each like action in Firestore (or as a Firebase Analytics event); run a weekly aggregation query in BigQuery or a scheduled Cloud Function to total likes per 7-day period.

## Task Success
