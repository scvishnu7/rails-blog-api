# rails-blog-api
a api aplication for blog using rails
endpoints


Articles
========

Create article
method POST 
url /articles
params  article[title]  and   article[text]

List articles
method GET
url /articles

Update article
method PATCH 
url /articles/:id
params  article[title]  and   article[text]

Delete article
method DELETE 
url /articles/:id

Comments
========

Add Comment
method POST
url /articles/:article_id/comments
params  comment[commenter]  ,  comment[body] , comment[article_id]

List Comment
method GET
url /articles/:article_id/comments

Update Comment
method PATCH
url /comments/:id
params  comment[commenter]  and  comment[body] 

Delete Comment
method DELETE
url /comments/:id

