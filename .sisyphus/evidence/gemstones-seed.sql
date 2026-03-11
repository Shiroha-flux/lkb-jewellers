INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_diamond'::enum_gemstone_stone_type, 1.01, 'VS1'::enum_gemstone_clarity, 'D'::enum_gemstone_colour, '6.5 x 4.5mm', 890, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/1ct-vs1-d.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_diamond'::enum_gemstone_stone_type
    AND carat = 1.01
    AND clarity = 'VS1'::enum_gemstone_clarity
    AND colour = 'D'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('6.5 x 4.5mm', '')
    AND price_usd = 890
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/1ct-vs1-d.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_diamond'::enum_gemstone_stone_type, 1.51, 'VVS1'::enum_gemstone_clarity, 'E'::enum_gemstone_colour, '7.5 x 5.5mm', 1290, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/1.5ct-vvs1-e.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_diamond'::enum_gemstone_stone_type
    AND carat = 1.51
    AND clarity = 'VVS1'::enum_gemstone_clarity
    AND colour = 'E'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('7.5 x 5.5mm', '')
    AND price_usd = 1290
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/1.5ct-vvs1-e.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_diamond'::enum_gemstone_stone_type, 2.02, 'VS2'::enum_gemstone_clarity, 'F'::enum_gemstone_colour, '8.5 x 6.5mm', 1890, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/2ct-vs2-f.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_diamond'::enum_gemstone_stone_type
    AND carat = 2.02
    AND clarity = 'VS2'::enum_gemstone_clarity
    AND colour = 'F'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('8.5 x 6.5mm', '')
    AND price_usd = 1890
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/2ct-vs2-f.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'moissanite'::enum_gemstone_stone_type, 1, 'VS1'::enum_gemstone_clarity, 'D'::enum_gemstone_colour, '6.5 x 4.5mm', 290, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/moissanite/1ct-vs1-d.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'moissanite'::enum_gemstone_stone_type
    AND carat = 1
    AND clarity = 'VS1'::enum_gemstone_clarity
    AND colour = 'D'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('6.5 x 4.5mm', '')
    AND price_usd = 290
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/moissanite/1ct-vs1-d.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'moissanite'::enum_gemstone_stone_type, 1.5, 'VVS2'::enum_gemstone_clarity, 'E'::enum_gemstone_colour, '7.5 x 5.5mm', 490, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/moissanite/1.5ct-vvs2-e.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'moissanite'::enum_gemstone_stone_type
    AND carat = 1.5
    AND clarity = 'VVS2'::enum_gemstone_clarity
    AND colour = 'E'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('7.5 x 5.5mm', '')
    AND price_usd = 490
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/moissanite/1.5ct-vvs2-e.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'natural_diamond'::enum_gemstone_stone_type, 1.02, 'VS1'::enum_gemstone_clarity, 'G'::enum_gemstone_colour, '6.5 x 4.5mm', 3200, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/natural/1ct-vs1-g.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'natural_diamond'::enum_gemstone_stone_type
    AND carat = 1.02
    AND clarity = 'VS1'::enum_gemstone_clarity
    AND colour = 'G'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('6.5 x 4.5mm', '')
    AND price_usd = 3200
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/natural/1ct-vs1-g.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'natural_diamond'::enum_gemstone_stone_type, 1.51, 'VVS1'::enum_gemstone_clarity, 'F'::enum_gemstone_colour, '7.5 x 5.5mm', 5800, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/natural/1.5ct-vvs1-f.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'natural_diamond'::enum_gemstone_stone_type
    AND carat = 1.51
    AND clarity = 'VVS1'::enum_gemstone_clarity
    AND colour = 'F'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('7.5 x 5.5mm', '')
    AND price_usd = 5800
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/natural/1.5ct-vvs1-f.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_diamond'::enum_gemstone_stone_type, 2.51, 'IF'::enum_gemstone_clarity, 'D'::enum_gemstone_colour, '9.5 x 7mm', 2890, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/2.5ct-if-d.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_diamond'::enum_gemstone_stone_type
    AND carat = 2.51
    AND clarity = 'IF'::enum_gemstone_clarity
    AND colour = 'D'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('9.5 x 7mm', '')
    AND price_usd = 2890
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/2.5ct-if-d.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_diamond'::enum_gemstone_stone_type, 3.01, 'VVS1'::enum_gemstone_clarity, 'E'::enum_gemstone_colour, '10.5 x 7.5mm', 3990, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/3ct-vvs1-e.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_diamond'::enum_gemstone_stone_type
    AND carat = 3.01
    AND clarity = 'VVS1'::enum_gemstone_clarity
    AND colour = 'E'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('10.5 x 7.5mm', '')
    AND price_usd = 3990
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/lab/3ct-vvs1-e.jpg', '')
);

INSERT INTO gemstones (stone_type, carat, clarity, colour, dimensions, price_usd, image_url, is_active)
SELECT 'lab_grown_sapphire'::enum_gemstone_stone_type, 1, 'VS1'::enum_gemstone_clarity, 'D'::enum_gemstone_colour, '6.5 x 4.5mm', 390, 'https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/sapphire/1ct-vs1-blue.jpg', true
WHERE NOT EXISTS (
  SELECT 1
  FROM gemstones
  WHERE stone_type = 'lab_grown_sapphire'::enum_gemstone_stone_type
    AND carat = 1
    AND clarity = 'VS1'::enum_gemstone_clarity
    AND colour = 'D'::enum_gemstone_colour
    AND COALESCE(dimensions, '') = COALESCE('6.5 x 4.5mm', '')
    AND price_usd = 390
    AND COALESCE(image_url, '') = COALESCE('https://media.cullenjewellery.com/cdn-cgi/image/width=400,height=400/products/diamonds/oval/sapphire/1ct-vs1-blue.jpg', '')
);
