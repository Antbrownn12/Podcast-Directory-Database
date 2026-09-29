USE podcast_directory;

SHOW TABLES ;
INSERT INTO category (category_id, category_name, description)
VALUES
(1, 'Entertainment', 'Podcasts about entertainment and popular culture'),
(2, 'Sports', 'Podcasts covering sports and athletes'),
(3, 'Technology', 'Podcasts about technology and innovation'),
(4, 'Business', 'Podcasts about business and finance'),
(5, 'Education', 'Podcasts focused on learning and education');

SELECT * FROM category;

INSERT INTO host (host_id, first_name, last_name, email, bio)
VALUES
(1, 'Joe', 'Budden', 'joe@example.com', 'Podcast host and media personality'),
(2, 'Marcus', 'Johnson', 'marcus@example.com', 'Sports podcast host'),
(3, 'Sarah', 'Williams', 'sarah@example.com', 'Technology podcast host'),
(4, 'David', 'Brown', 'david@example.com', 'Business podcast host'),
(5, 'Emily', 'Davis', 'emily@example.com', 'Education podcast host');

SELECT * FROM host;
INSERT INTO podcast
(podcast_id, title, description, release_date, category_id, host_id)
VALUES
(1, 'The Joe Budden Podcast',
 'Entertainment and culture podcast hosted by Joe Budden',
 '2015-02-18', 1, 1),

(2, 'Sports Talk Weekly',
 'Podcast discussing sports news and athletes',
 '2024-01-10', 2, 2),

(3, 'Tech Today',
 'Podcast discussing technology and innovation',
 '2024-02-15', 3, 3),

(4, 'Business Matters',
 'Podcast discussing business and finance',
 '2024-03-20', 4, 4),

(5, 'Learning Today',
 'Educational podcast focused on learning',
 '2024-04-12', 5, 5);

SELECT * FROM podcast;
INSERT INTO episode
(episode_id, podcast_id, title, description, release_date, duration_minutes)
VALUES
(1, 1, 'Episode 1', 'Discussion about entertainment and current events', '2025-01-08', 120),
(2, 1, 'Episode 2', 'Discussion about music and popular culture', '2025-01-11', 135),
(3, 2, 'Sports Weekly Episode 1', 'Discussion about recent sports news', '2025-01-15', 60),
(4, 3, 'Tech Today Episode 1', 'Discussion about new technology', '2025-02-20', 45),
(5, 4, 'Business Matters Episode 1', 'Discussion about business and finance', '2025-03-25', 50);

SELECT * FROM episode;

INSERT INTO listener
(listener_id, first_name, last_name, email, date_joined)
VALUES
(1, 'Michael', 'Smith', 'michael@example.com', '2025-01-05'),
(2, 'Ashley', 'Johnson', 'ashley@example.com', '2025-01-10'),
(3, 'Chris', 'Williams', 'chris@example.com', '2025-02-01'),
(4, 'Jessica', 'Brown', 'jessica@example.com', '2025-02-15'),
(5, 'Daniel', 'Davis', 'daniel@example.com', '2025-03-01');

SELECT * FROM listener;

INSERT INTO subscription
(listener_id, podcast_id, subscription_date)
VALUES
(1, 1, '2025-01-06'),
(1, 2, '2025-01-07'),
(2, 1, '2025-01-11'),
(3, 3, '2025-02-02'),
(4, 1, '2025-02-16'),
(4, 4, '2025-02-17'),
(5, 5, '2025-03-02');

SELECT * FROM subscription;

SELECT
    podcast.title AS podcast_title,
    category.category_name,
    host.first_name,
    host.last_name
FROM podcast

JOIN category
    ON podcast.category_id = category.category_id
JOIN host
    ON podcast.host_id = host.host_id;
    
    SELECT
    listener.first_name,
    listener.last_name,
    podcast.title AS podcast_title,
    subscription.subscription_date
FROM subscription
JOIN listener
    ON subscription.listener_id = listener.listener_id
JOIN podcast
    ON subscription.podcast_id = podcast.podcast_id;