# rails-blog-api
a api aplication for blog using rails
endpoints


#### Articles


1. Create article
  * **method:** POST 
  * **url:** /articles
  * **params:**  article[title]  and   article[text]

2. List articles
  * **method:** GET
  * **url:** /articles

3. Update article
  * **method:** PATCH 
  * **url:** /articles/:id
  * **params:**  article[title]  and   article[text]

4. Delete article
  * **method:** DELETE 
  * **url:** /articles/:id

#### Comments


1. Add Comment
  * **method:** POST
  * **url:** /articles/:article_id/comments
  * **params:**  comment[commenter]  ,  comment[body] , comment[article_id]

2. List Comment
  * **method:** GET
  * **url:** /articles/:article_id/comments

3. Update Comment
  * **method:** PATCH
  * **url:** /comments/:id
  * **params:**  comment[commenter]  and  comment[body] 

4. Delete Comment
  * **method:** DELETE
  * **url:** /comments/:id
