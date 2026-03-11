DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-billie',
    'Billie',
    'Billie - Elongated Cushion Bezel Solitaire with Cathedral Setting Engagement Ring',
    'Billie is a stunning bezel-set elongated cushion solitaire set within a sweeping cathedral band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-billie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-billie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-billie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-billie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/billie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/billie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-billie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-billie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-billie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-billie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-billie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-billie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-billie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-billie-size-0', 1, v_id, 'D'),
      ('ring-billie-size-1', 2, v_id, 'E'),
      ('ring-billie-size-2', 3, v_id, 'F'),
      ('ring-billie-size-3', 4, v_id, 'G'),
      ('ring-billie-size-4', 5, v_id, 'H'),
      ('ring-billie-size-5', 6, v_id, 'I'),
      ('ring-billie-size-6', 7, v_id, 'J'),
      ('ring-billie-size-7', 8, v_id, 'K'),
      ('ring-billie-size-8', 9, v_id, 'L'),
      ('ring-billie-size-9', 10, v_id, 'M'),
      ('ring-billie-size-10', 11, v_id, 'N'),
      ('ring-billie-size-11', 12, v_id, 'O'),
      ('ring-billie-size-12', 13, v_id, 'P'),
      ('ring-billie-size-13', 14, v_id, 'Q'),
      ('ring-billie-size-14', 15, v_id, 'R'),
      ('ring-billie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-billie-specs',
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
    'ring-blair',
    'Blair',
    'Blair - Oval 4 Claw Solitaire with Split Shank and Cathedral Setting Engagement Ring',
    'The Blair engagement ring adds a distinct quality to the classic oval solitaire design with a uniquely divergent band seated within a cathedral 4-claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-blair';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-blair-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blair-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blair-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blair/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blair/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-blair-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-blair-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-blair-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-blair-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blair-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-blair-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-blair-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-blair-size-0', 1, v_id, 'D'),
      ('ring-blair-size-1', 2, v_id, 'E'),
      ('ring-blair-size-2', 3, v_id, 'F'),
      ('ring-blair-size-3', 4, v_id, 'G'),
      ('ring-blair-size-4', 5, v_id, 'H'),
      ('ring-blair-size-5', 6, v_id, 'I'),
      ('ring-blair-size-6', 7, v_id, 'J'),
      ('ring-blair-size-7', 8, v_id, 'K'),
      ('ring-blair-size-8', 9, v_id, 'L'),
      ('ring-blair-size-9', 10, v_id, 'M'),
      ('ring-blair-size-10', 11, v_id, 'N'),
      ('ring-blair-size-11', 12, v_id, 'O'),
      ('ring-blair-size-12', 13, v_id, 'P'),
      ('ring-blair-size-13', 14, v_id, 'Q'),
      ('ring-blair-size-14', 15, v_id, 'R'),
      ('ring-blair-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-blair-specs',
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
    'ring-blossom',
    'Blossom',
    'Blossom - Pear Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Blossom centres a pear stone in a refined five-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-blossom';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-blossom-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blossom-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-blossom-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/blossom/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/blossom/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-blossom-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-blossom-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-blossom-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-blossom-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-blossom-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-blossom-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-blossom-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-blossom-size-0', 1, v_id, 'D'),
      ('ring-blossom-size-1', 2, v_id, 'E'),
      ('ring-blossom-size-2', 3, v_id, 'F'),
      ('ring-blossom-size-3', 4, v_id, 'G'),
      ('ring-blossom-size-4', 5, v_id, 'H'),
      ('ring-blossom-size-5', 6, v_id, 'I'),
      ('ring-blossom-size-6', 7, v_id, 'J'),
      ('ring-blossom-size-7', 8, v_id, 'K'),
      ('ring-blossom-size-8', 9, v_id, 'L'),
      ('ring-blossom-size-9', 10, v_id, 'M'),
      ('ring-blossom-size-10', 11, v_id, 'N'),
      ('ring-blossom-size-11', 12, v_id, 'O'),
      ('ring-blossom-size-12', 13, v_id, 'P'),
      ('ring-blossom-size-13', 14, v_id, 'Q'),
      ('ring-blossom-size-14', 15, v_id, 'R'),
      ('ring-blossom-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-blossom-specs',
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
    'ring-bonnie',
    'Bonnie',
    'Bonnie - Round 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Seated atop a spectacular cathedral setting, Bonnie is a beautiful round solitaire with four eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-bonnie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-bonnie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bonnie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-bonnie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/bonnie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/bonnie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-bonnie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-bonnie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-bonnie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-bonnie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-bonnie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-bonnie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-bonnie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-bonnie-size-0', 1, v_id, 'D'),
      ('ring-bonnie-size-1', 2, v_id, 'E'),
      ('ring-bonnie-size-2', 3, v_id, 'F'),
      ('ring-bonnie-size-3', 4, v_id, 'G'),
      ('ring-bonnie-size-4', 5, v_id, 'H'),
      ('ring-bonnie-size-5', 6, v_id, 'I'),
      ('ring-bonnie-size-6', 7, v_id, 'J'),
      ('ring-bonnie-size-7', 8, v_id, 'K'),
      ('ring-bonnie-size-8', 9, v_id, 'L'),
      ('ring-bonnie-size-9', 10, v_id, 'M'),
      ('ring-bonnie-size-10', 11, v_id, 'N'),
      ('ring-bonnie-size-11', 12, v_id, 'O'),
      ('ring-bonnie-size-12', 13, v_id, 'P'),
      ('ring-bonnie-size-13', 14, v_id, 'Q'),
      ('ring-bonnie-size-14', 15, v_id, 'R'),
      ('ring-bonnie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-bonnie-specs',
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
    'ring-brandi',
    'Brandi',
    'Brandi - Oval 4 Claw Solitaire with Marquise-Round Accent Stones and Hidden Halo Engagement Ring',
    'The striking Brandi design showcases a stunning 4-claw oval cut centre stone, sparkling hidden halo and a sleek band featuring two pairs of round and marquise cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-brandi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-brandi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brandi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-brandi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/brandi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/brandi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-brandi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-brandi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-brandi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-brandi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-brandi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-brandi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-brandi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-brandi-size-0', 1, v_id, 'D'),
      ('ring-brandi-size-1', 2, v_id, 'E'),
      ('ring-brandi-size-2', 3, v_id, 'F'),
      ('ring-brandi-size-3', 4, v_id, 'G'),
      ('ring-brandi-size-4', 5, v_id, 'H'),
      ('ring-brandi-size-5', 6, v_id, 'I'),
      ('ring-brandi-size-6', 7, v_id, 'J'),
      ('ring-brandi-size-7', 8, v_id, 'K'),
      ('ring-brandi-size-8', 9, v_id, 'L'),
      ('ring-brandi-size-9', 10, v_id, 'M'),
      ('ring-brandi-size-10', 11, v_id, 'N'),
      ('ring-brandi-size-11', 12, v_id, 'O'),
      ('ring-brandi-size-12', 13, v_id, 'P'),
      ('ring-brandi-size-13', 14, v_id, 'Q'),
      ('ring-brandi-size-14', 15, v_id, 'R'),
      ('ring-brandi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-brandi-specs',
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