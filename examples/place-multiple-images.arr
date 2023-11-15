use context essentials2021
include color
#|
  When drawing more complex figures, it can be necessary to nest a lot of images. This examples first shows how this is done with nesting, and then how the same thing can be done with a recursive function.
   
 With only a few elements, it may be just as quick and easy to use nesting. For more complex images, however, it can be cleaner to use a recursive function. It is also easier to change and expand an image with a recursive function than with nesting.
   
 The example figure here is the flag of Benin: https://en.wikipedia.org/wiki/Flag_of_Benin
|#

######## With nesting ########
place-image(rectangle(60, 100, "solid", color(0, 138, 80, 1)), 30, 50,
  place-image(rectangle(150, 100, "solid", color(233,9, 41, 1)), 75, 100,
  place-image(rectangle(150, 100, "solid", color(252, 210, 15, 1)), 75, 50,
      empty-scene(150, 100))))


######## With a recursive funciont ########
# Step 1: Create a datastructure to keep the image along with x-position (xp) and y-position (yp)
data ImageElement:
    image-element(img :: Image, xp :: Number, yp :: Number) 
end

# Step 2: Create a list where each entry is an ImageElement. The first element will be placed on top.
list-of-images = [list:
  image-element(rectangle(60, 100, "solid", color(0, 138, 80, 1)), 30, 50),
  image-element(rectangle(150, 100, "solid", color(233,9, 41, 1)), 75, 100),
  image-element(rectangle(150, 100, "solid", color(252, 210, 15, 1)), 75, 50)
]

# Step 3: Create the background
background = empty-scene(150, 100)

# Step 4: Create a recursive function that place the first element of the list from step 2 at its position, and then calls itself on the rest of the list to repeat the procedure. This should only happen if there are more any elements left in the list. If not, return the background.
fun place-images(image-list):
  if image-list.length() > 0:
    place-image(image-list.first.img, image-list.first.xp, image-list.first.yp,place-images(image-list.rest))
  else:
    background
  end
end

# Step 5: Call the function with the list-of-images:
place-images(list-of-images)
