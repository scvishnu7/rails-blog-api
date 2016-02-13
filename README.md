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

3. View article with comments
  * **method:** GET
  * **url:** /articles/:id

4. Update article
  * **method:** PATCH 
  * **url:** /articles/:id
  * **params:**  article[title]  and   article[text]

5. Delete article
  * **method:** DELETE 
  * **url:** /articles/:id

#### Comments


1. Add Comment
  * **method:** POST
  * **url:** /articles/:article_id/comments
  * **params:**  comment[commenter]  ,  comment[body]

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

#### Examples
**To get the list of articles**

make `GET` request to `{{server}}/articles`

The response will be
```
{
    "status": "ok",
    "message": "Success!",
    "data": [
        {
            "id": 2,
            "title": "new title for 2",
            "text": "new text for 2",
            "created_at": "2016-02-12T01:17:37.154Z",
            "updated_at": "2016-02-12T08:00:06.436Z"
        },
        {
            "id": 3,
            "title": "something for 3",
            "text": "another thing for text body",
            "created_at": "2016-02-12T07:56:59.380Z",
            "updated_at": "2016-02-12T08:00:27.975Z"
        }
    ]
}
```

**For posting comment to article with article_id 3**

make `POST` request to `/articles/3/comments` with `comment[commenter]=name of commenter` and `comment[body]=body of comment` as parameters.

Then the response will come as
```
{
    "status": "ok",
    "message": "Comment Added",
    "id": 43
}
```

 **To delete comment with comment_id 23**
 
 make `DELETE` request to `/comments/23`.

The response will be a json
```
{
    "status": "ok",
    "message": "Comment Deleted",
    "id": 43
}
```

