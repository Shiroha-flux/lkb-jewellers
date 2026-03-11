DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-zara',
    'Zara',
    'Zara - Radiant East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Fiona is an east–west set radiant cut centre stone positioned low within a scooped basket. The setting allows the profile to sit flush against a classic band, creating a clean, understated design with smooth, continuous lines. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zara';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zara-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zara-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zara-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zara/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zara/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zara-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zara-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zara-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zara-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zara-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zara-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zara-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zara-size-0', 1, v_id, 'D'),
      ('ring-zara-size-1', 2, v_id, 'E'),
      ('ring-zara-size-2', 3, v_id, 'F'),
      ('ring-zara-size-3', 4, v_id, 'G'),
      ('ring-zara-size-4', 5, v_id, 'H'),
      ('ring-zara-size-5', 6, v_id, 'I'),
      ('ring-zara-size-6', 7, v_id, 'J'),
      ('ring-zara-size-7', 8, v_id, 'K'),
      ('ring-zara-size-8', 9, v_id, 'L'),
      ('ring-zara-size-9', 10, v_id, 'M'),
      ('ring-zara-size-10', 11, v_id, 'N'),
      ('ring-zara-size-11', 12, v_id, 'O'),
      ('ring-zara-size-12', 13, v_id, 'P'),
      ('ring-zara-size-13', 14, v_id, 'Q'),
      ('ring-zara-size-14', 15, v_id, 'R'),
      ('ring-zara-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zara-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-zariyah',
    'Zariyah',
    'Zariyah - Marquise 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'The beauty of the classic 6-claw marquise solitaire is elevated in the Zariyah ring with the added sparkle of a hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zariyah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zariyah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zariyah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zariyah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zariyah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zariyah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zariyah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zariyah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zariyah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zariyah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zariyah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zariyah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zariyah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zariyah-size-0', 1, v_id, 'D'),
      ('ring-zariyah-size-1', 2, v_id, 'E'),
      ('ring-zariyah-size-2', 3, v_id, 'F'),
      ('ring-zariyah-size-3', 4, v_id, 'G'),
      ('ring-zariyah-size-4', 5, v_id, 'H'),
      ('ring-zariyah-size-5', 6, v_id, 'I'),
      ('ring-zariyah-size-6', 7, v_id, 'J'),
      ('ring-zariyah-size-7', 8, v_id, 'K'),
      ('ring-zariyah-size-8', 9, v_id, 'L'),
      ('ring-zariyah-size-9', 10, v_id, 'M'),
      ('ring-zariyah-size-10', 11, v_id, 'N'),
      ('ring-zariyah-size-11', 12, v_id, 'O'),
      ('ring-zariyah-size-12', 13, v_id, 'P'),
      ('ring-zariyah-size-13', 14, v_id, 'Q'),
      ('ring-zariyah-size-14', 15, v_id, 'R'),
      ('ring-zariyah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zariyah-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-zelda',
    'Zelda',
    'Zelda - Oval Bezel Trilogy Engagement Ring',
    'The Zelda engagement ring is a beautiful trilogy of three bezel-set oval cut stones, creating a wonderfully symbiotic look. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zelda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zelda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zelda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zelda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zelda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zelda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zelda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zelda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zelda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zelda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zelda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zelda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zelda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zelda-size-0', 1, v_id, 'D'),
      ('ring-zelda-size-1', 2, v_id, 'E'),
      ('ring-zelda-size-2', 3, v_id, 'F'),
      ('ring-zelda-size-3', 4, v_id, 'G'),
      ('ring-zelda-size-4', 5, v_id, 'H'),
      ('ring-zelda-size-5', 6, v_id, 'I'),
      ('ring-zelda-size-6', 7, v_id, 'J'),
      ('ring-zelda-size-7', 8, v_id, 'K'),
      ('ring-zelda-size-8', 9, v_id, 'L'),
      ('ring-zelda-size-9', 10, v_id, 'M'),
      ('ring-zelda-size-10', 11, v_id, 'N'),
      ('ring-zelda-size-11', 12, v_id, 'O'),
      ('ring-zelda-size-12', 13, v_id, 'P'),
      ('ring-zelda-size-13', 14, v_id, 'Q'),
      ('ring-zelda-size-14', 15, v_id, 'R'),
      ('ring-zelda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zelda-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-zoe',
    'Zoe',
    'Zoe - Radiant Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'The Zoe engagement ring is a modern design showcasing a beautiful radiant cut centre stone framed within a bezel cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zoe';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zoe-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zoe-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zoe-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zoe/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zoe/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zoe-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zoe-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zoe-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zoe-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zoe-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zoe-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zoe-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zoe-size-0', 1, v_id, 'D'),
      ('ring-zoe-size-1', 2, v_id, 'E'),
      ('ring-zoe-size-2', 3, v_id, 'F'),
      ('ring-zoe-size-3', 4, v_id, 'G'),
      ('ring-zoe-size-4', 5, v_id, 'H'),
      ('ring-zoe-size-5', 6, v_id, 'I'),
      ('ring-zoe-size-6', 7, v_id, 'J'),
      ('ring-zoe-size-7', 8, v_id, 'K'),
      ('ring-zoe-size-8', 9, v_id, 'L'),
      ('ring-zoe-size-9', 10, v_id, 'M'),
      ('ring-zoe-size-10', 11, v_id, 'N'),
      ('ring-zoe-size-11', 12, v_id, 'O'),
      ('ring-zoe-size-12', 13, v_id, 'P'),
      ('ring-zoe-size-13', 14, v_id, 'Q'),
      ('ring-zoe-size-14', 15, v_id, 'R'),
      ('ring-zoe-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zoe-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-zya',
    'Zya',
    'Zya - Round Claw Solitaire with Trellis Gallery, Lattice Detail and Cathedral Low Setting Engagement Ring',
    'The Zya engagement ring features a beautiful round cut centre stone held in a graceful 6-claw woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-zya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-zya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-zya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/zya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/zya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-zya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-zya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-zya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-zya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-zya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-zya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-zya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-zya-size-0', 1, v_id, 'D'),
      ('ring-zya-size-1', 2, v_id, 'E'),
      ('ring-zya-size-2', 3, v_id, 'F'),
      ('ring-zya-size-3', 4, v_id, 'G'),
      ('ring-zya-size-4', 5, v_id, 'H'),
      ('ring-zya-size-5', 6, v_id, 'I'),
      ('ring-zya-size-6', 7, v_id, 'J'),
      ('ring-zya-size-7', 8, v_id, 'K'),
      ('ring-zya-size-8', 9, v_id, 'L'),
      ('ring-zya-size-9', 10, v_id, 'M'),
      ('ring-zya-size-10', 11, v_id, 'N'),
      ('ring-zya-size-11', 12, v_id, 'O'),
      ('ring-zya-size-12', 13, v_id, 'P'),
      ('ring-zya-size-13', 14, v_id, 'Q'),
      ('ring-zya-size-14', 15, v_id, 'R'),
      ('ring-zya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-zya-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;