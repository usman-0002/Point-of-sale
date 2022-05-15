____________________________Ful Customized Point Of Sale System_____________________________

Database: Postgres

1. Devise Gem: (For User Authentication)

3. Bootstrap Gem: (for styling)

4. Toast Rails Gem

5. Cloudinary Gem added for images uploading

6. Pagy Gem: for pagination


 __________________________________Models________________________________________________
 1. Product Model: Includes name, description, code( SKU ), quantity( Stock ), and category
 2. Category Model: Includes Unique name 
    Note: Each product must have a category , but if after some time we delete a certain category,
    then associated products will remain there, but in view we will display 'Others' as category for those products. 
