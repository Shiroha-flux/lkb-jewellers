DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-francesca',
    'Francesca',
    'Francesca - Pear and Pear Claw Toi et Moi Engagement Ring',
    'Francesca is a beautiful toi et moi engagement ring featuring two pear cut centre stones positioned in a complementary manner to radiate a fresh yet timeless aesthetic. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-francesca';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-francesca-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-francesca-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-francesca-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/francesca/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/francesca/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-francesca-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-francesca-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-francesca-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-francesca-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-francesca-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-francesca-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-francesca-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-francesca-size-0', 1, v_id, 'D'),
      ('ring-francesca-size-1', 2, v_id, 'E'),
      ('ring-francesca-size-2', 3, v_id, 'F'),
      ('ring-francesca-size-3', 4, v_id, 'G'),
      ('ring-francesca-size-4', 5, v_id, 'H'),
      ('ring-francesca-size-5', 6, v_id, 'I'),
      ('ring-francesca-size-6', 7, v_id, 'J'),
      ('ring-francesca-size-7', 8, v_id, 'K'),
      ('ring-francesca-size-8', 9, v_id, 'L'),
      ('ring-francesca-size-9', 10, v_id, 'M'),
      ('ring-francesca-size-10', 11, v_id, 'N'),
      ('ring-francesca-size-11', 12, v_id, 'O'),
      ('ring-francesca-size-12', 13, v_id, 'P'),
      ('ring-francesca-size-13', 14, v_id, 'Q'),
      ('ring-francesca-size-14', 15, v_id, 'R'),
      ('ring-francesca-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-francesca-specs',
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
    'ring-frankie',
    'Frankie',
    'Frankie - Statement Radiant East West Bezel Solitaire with Flat Cigar Band Engagement Ring',
    'Frankie is an east–west set radiant-cut centre stone enclosed within a statement bezel. The design flows into a flat-profile cigar band, creating clean lines and a modern, bold composition. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-frankie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-frankie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-frankie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-frankie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/frankie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/frankie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-frankie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-frankie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-frankie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-frankie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-frankie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-frankie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-frankie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-frankie-size-0', 1, v_id, 'D'),
      ('ring-frankie-size-1', 2, v_id, 'E'),
      ('ring-frankie-size-2', 3, v_id, 'F'),
      ('ring-frankie-size-3', 4, v_id, 'G'),
      ('ring-frankie-size-4', 5, v_id, 'H'),
      ('ring-frankie-size-5', 6, v_id, 'I'),
      ('ring-frankie-size-6', 7, v_id, 'J'),
      ('ring-frankie-size-7', 8, v_id, 'K'),
      ('ring-frankie-size-8', 9, v_id, 'L'),
      ('ring-frankie-size-9', 10, v_id, 'M'),
      ('ring-frankie-size-10', 11, v_id, 'N'),
      ('ring-frankie-size-11', 12, v_id, 'O'),
      ('ring-frankie-size-12', 13, v_id, 'P'),
      ('ring-frankie-size-13', 14, v_id, 'Q'),
      ('ring-frankie-size-14', 15, v_id, 'R'),
      ('ring-frankie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-frankie-specs',
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
    'ring-freya',
    'Freya',
    'Freya - Emerald 4 Claw Solitaire with Tapered Band and Cathedral Setting Engagement Ring',
    'Sleek in its design, the Freya engagement ring features an elegant emerald cut centre stone held by four round claws and set low on a slim tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-freya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-freya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-freya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-freya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-freya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-freya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-freya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-freya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-freya-size-0', 1, v_id, 'D'),
      ('ring-freya-size-1', 2, v_id, 'E'),
      ('ring-freya-size-2', 3, v_id, 'F'),
      ('ring-freya-size-3', 4, v_id, 'G'),
      ('ring-freya-size-4', 5, v_id, 'H'),
      ('ring-freya-size-5', 6, v_id, 'I'),
      ('ring-freya-size-6', 7, v_id, 'J'),
      ('ring-freya-size-7', 8, v_id, 'K'),
      ('ring-freya-size-8', 9, v_id, 'L'),
      ('ring-freya-size-9', 10, v_id, 'M'),
      ('ring-freya-size-10', 11, v_id, 'N'),
      ('ring-freya-size-11', 12, v_id, 'O'),
      ('ring-freya-size-12', 13, v_id, 'P'),
      ('ring-freya-size-13', 14, v_id, 'Q'),
      ('ring-freya-size-14', 15, v_id, 'R'),
      ('ring-freya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-freya-specs',
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
    'ring-freesia',
    'Freesia',
    'Freesia - Emerald Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Freesia centres a emerald stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-freesia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-freesia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freesia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-freesia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/freesia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/freesia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-freesia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-freesia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-freesia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-freesia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-freesia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-freesia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-freesia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-freesia-size-0', 1, v_id, 'D'),
      ('ring-freesia-size-1', 2, v_id, 'E'),
      ('ring-freesia-size-2', 3, v_id, 'F'),
      ('ring-freesia-size-3', 4, v_id, 'G'),
      ('ring-freesia-size-4', 5, v_id, 'H'),
      ('ring-freesia-size-5', 6, v_id, 'I'),
      ('ring-freesia-size-6', 7, v_id, 'J'),
      ('ring-freesia-size-7', 8, v_id, 'K'),
      ('ring-freesia-size-8', 9, v_id, 'L'),
      ('ring-freesia-size-9', 10, v_id, 'M'),
      ('ring-freesia-size-10', 11, v_id, 'N'),
      ('ring-freesia-size-11', 12, v_id, 'O'),
      ('ring-freesia-size-12', 13, v_id, 'P'),
      ('ring-freesia-size-13', 14, v_id, 'Q'),
      ('ring-freesia-size-14', 15, v_id, 'R'),
      ('ring-freesia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-freesia-specs',
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
    'ring-gabrielle',
    'Gabrielle',
    'Gabrielle - Round 6 Claw Solitaire with Square Tips and Solid Cathedral Setting Engagement Ring',
    'The Gabrielle is a signature round solitaire design featuring a beautiful round cut centre stone and 6-claw setting, placed low on a polished band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gabrielle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gabrielle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gabrielle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gabrielle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gabrielle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gabrielle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gabrielle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gabrielle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gabrielle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gabrielle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gabrielle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gabrielle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gabrielle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gabrielle-size-0', 1, v_id, 'D'),
      ('ring-gabrielle-size-1', 2, v_id, 'E'),
      ('ring-gabrielle-size-2', 3, v_id, 'F'),
      ('ring-gabrielle-size-3', 4, v_id, 'G'),
      ('ring-gabrielle-size-4', 5, v_id, 'H'),
      ('ring-gabrielle-size-5', 6, v_id, 'I'),
      ('ring-gabrielle-size-6', 7, v_id, 'J'),
      ('ring-gabrielle-size-7', 8, v_id, 'K'),
      ('ring-gabrielle-size-8', 9, v_id, 'L'),
      ('ring-gabrielle-size-9', 10, v_id, 'M'),
      ('ring-gabrielle-size-10', 11, v_id, 'N'),
      ('ring-gabrielle-size-11', 12, v_id, 'O'),
      ('ring-gabrielle-size-12', 13, v_id, 'P'),
      ('ring-gabrielle-size-13', 14, v_id, 'Q'),
      ('ring-gabrielle-size-14', 15, v_id, 'R'),
      ('ring-gabrielle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gabrielle-specs',
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