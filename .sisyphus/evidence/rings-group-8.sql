DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-poppy',
    'Poppy',
    'Poppy - Elongated Cushion Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Poppy centres an elongated cushion stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-poppy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-poppy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/poppy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/poppy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-poppy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/poppy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/poppy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-poppy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/poppy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/poppy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-poppy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-poppy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-poppy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-poppy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-poppy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-poppy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-poppy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-poppy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-poppy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-poppy-size-0', 1, v_id, 'D'),
      ('ring-poppy-size-1', 2, v_id, 'E'),
      ('ring-poppy-size-2', 3, v_id, 'F'),
      ('ring-poppy-size-3', 4, v_id, 'G'),
      ('ring-poppy-size-4', 5, v_id, 'H'),
      ('ring-poppy-size-5', 6, v_id, 'I'),
      ('ring-poppy-size-6', 7, v_id, 'J'),
      ('ring-poppy-size-7', 8, v_id, 'K'),
      ('ring-poppy-size-8', 9, v_id, 'L'),
      ('ring-poppy-size-9', 10, v_id, 'M'),
      ('ring-poppy-size-10', 11, v_id, 'N'),
      ('ring-poppy-size-11', 12, v_id, 'O'),
      ('ring-poppy-size-12', 13, v_id, 'P'),
      ('ring-poppy-size-13', 14, v_id, 'Q'),
      ('ring-poppy-size-14', 15, v_id, 'R'),
      ('ring-poppy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-poppy-specs',
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
    'ring-racquel',
    'Racquel',
    'Racquel - Radiant 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Raquel features a radiant-cut centre stone elevated in a cathedral setting with a hidden halo beneath the gallery. A pavé-set band adds structured detail, forming a clean, contemporary design with refined proportions. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-racquel';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-racquel-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/racquel/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/racquel/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-racquel-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/racquel/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/racquel/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-racquel-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/racquel/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/racquel/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-racquel-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-racquel-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-racquel-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-racquel-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-racquel-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-racquel-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-racquel-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-racquel-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-racquel-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-racquel-size-0', 1, v_id, 'D'),
      ('ring-racquel-size-1', 2, v_id, 'E'),
      ('ring-racquel-size-2', 3, v_id, 'F'),
      ('ring-racquel-size-3', 4, v_id, 'G'),
      ('ring-racquel-size-4', 5, v_id, 'H'),
      ('ring-racquel-size-5', 6, v_id, 'I'),
      ('ring-racquel-size-6', 7, v_id, 'J'),
      ('ring-racquel-size-7', 8, v_id, 'K'),
      ('ring-racquel-size-8', 9, v_id, 'L'),
      ('ring-racquel-size-9', 10, v_id, 'M'),
      ('ring-racquel-size-10', 11, v_id, 'N'),
      ('ring-racquel-size-11', 12, v_id, 'O'),
      ('ring-racquel-size-12', 13, v_id, 'P'),
      ('ring-racquel-size-13', 14, v_id, 'Q'),
      ('ring-racquel-size-14', 15, v_id, 'R'),
      ('ring-racquel-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-racquel-specs',
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
    'ring-raleigh',
    'Raleigh',
    'Raleigh - Emerald 4 Claw Solitaire with Pear Accents and Round Shoulder Stones Engagement Ring',
    'Raleigh is a stunning emerald cut engagement ring with round &amp;amp; pear accent stones, complete with a low basket setting and slim tapered band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-raleigh';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-raleigh-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/raleigh/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/raleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-raleigh-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/raleigh/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/raleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-raleigh-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/raleigh/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/raleigh/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-raleigh-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-raleigh-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-raleigh-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-raleigh-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-raleigh-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-raleigh-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-raleigh-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-raleigh-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-raleigh-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-raleigh-size-0', 1, v_id, 'D'),
      ('ring-raleigh-size-1', 2, v_id, 'E'),
      ('ring-raleigh-size-2', 3, v_id, 'F'),
      ('ring-raleigh-size-3', 4, v_id, 'G'),
      ('ring-raleigh-size-4', 5, v_id, 'H'),
      ('ring-raleigh-size-5', 6, v_id, 'I'),
      ('ring-raleigh-size-6', 7, v_id, 'J'),
      ('ring-raleigh-size-7', 8, v_id, 'K'),
      ('ring-raleigh-size-8', 9, v_id, 'L'),
      ('ring-raleigh-size-9', 10, v_id, 'M'),
      ('ring-raleigh-size-10', 11, v_id, 'N'),
      ('ring-raleigh-size-11', 12, v_id, 'O'),
      ('ring-raleigh-size-12', 13, v_id, 'P'),
      ('ring-raleigh-size-13', 14, v_id, 'Q'),
      ('ring-raleigh-size-14', 15, v_id, 'R'),
      ('ring-raleigh-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-raleigh-specs',
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
    'ring-rachel',
    'Rachel',
    'Rachel - Statement Radiant Bezel Solitaire with Open Cathedral Setting Engagement Ring',
    'Featuring a gorgeous radiant cut stone framed within a bezel setting, Rachel is completed by a sweeping cathedral band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rachel';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rachel-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rachel/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rachel/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rachel-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rachel/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rachel/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rachel-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rachel/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rachel/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rachel-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rachel-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rachel-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rachel-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rachel-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rachel-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rachel-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rachel-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rachel-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rachel-size-0', 1, v_id, 'D'),
      ('ring-rachel-size-1', 2, v_id, 'E'),
      ('ring-rachel-size-2', 3, v_id, 'F'),
      ('ring-rachel-size-3', 4, v_id, 'G'),
      ('ring-rachel-size-4', 5, v_id, 'H'),
      ('ring-rachel-size-5', 6, v_id, 'I'),
      ('ring-rachel-size-6', 7, v_id, 'J'),
      ('ring-rachel-size-7', 8, v_id, 'K'),
      ('ring-rachel-size-8', 9, v_id, 'L'),
      ('ring-rachel-size-9', 10, v_id, 'M'),
      ('ring-rachel-size-10', 11, v_id, 'N'),
      ('ring-rachel-size-11', 12, v_id, 'O'),
      ('ring-rachel-size-12', 13, v_id, 'P'),
      ('ring-rachel-size-13', 14, v_id, 'Q'),
      ('ring-rachel-size-14', 15, v_id, 'R'),
      ('ring-rachel-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rachel-specs',
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
    'ring-rita',
    'Rita',
    'Rita - Round Claw Solitaire with Crossover Petal Gallery Engagement Ring',
    'Rita is a sweet round solitaire engagement ring characterised by a beautiful 6-claw setting designed to resemble the delicate petals of a rose. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rita';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rita-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rita/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rita/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rita-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rita/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rita/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rita-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rita/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rita/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rita-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rita-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rita-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rita-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rita-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rita-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rita-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rita-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rita-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rita-size-0', 1, v_id, 'D'),
      ('ring-rita-size-1', 2, v_id, 'E'),
      ('ring-rita-size-2', 3, v_id, 'F'),
      ('ring-rita-size-3', 4, v_id, 'G'),
      ('ring-rita-size-4', 5, v_id, 'H'),
      ('ring-rita-size-5', 6, v_id, 'I'),
      ('ring-rita-size-6', 7, v_id, 'J'),
      ('ring-rita-size-7', 8, v_id, 'K'),
      ('ring-rita-size-8', 9, v_id, 'L'),
      ('ring-rita-size-9', 10, v_id, 'M'),
      ('ring-rita-size-10', 11, v_id, 'N'),
      ('ring-rita-size-11', 12, v_id, 'O'),
      ('ring-rita-size-12', 13, v_id, 'P'),
      ('ring-rita-size-13', 14, v_id, 'Q'),
      ('ring-rita-size-14', 15, v_id, 'R'),
      ('ring-rita-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rita-specs',
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
    'ring-river',
    'River',
    'River - Marquise 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'The River engagement ring is an elegant east-west design featuring a marquise cut centre stone placed horizontally on a polished band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-river';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-river-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-river-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-river-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/river/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/river/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-river-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-river-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-river-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-river-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-river-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-river-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-river-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-river-size-0', 1, v_id, 'D'),
      ('ring-river-size-1', 2, v_id, 'E'),
      ('ring-river-size-2', 3, v_id, 'F'),
      ('ring-river-size-3', 4, v_id, 'G'),
      ('ring-river-size-4', 5, v_id, 'H'),
      ('ring-river-size-5', 6, v_id, 'I'),
      ('ring-river-size-6', 7, v_id, 'J'),
      ('ring-river-size-7', 8, v_id, 'K'),
      ('ring-river-size-8', 9, v_id, 'L'),
      ('ring-river-size-9', 10, v_id, 'M'),
      ('ring-river-size-10', 11, v_id, 'N'),
      ('ring-river-size-11', 12, v_id, 'O'),
      ('ring-river-size-12', 13, v_id, 'P'),
      ('ring-river-size-13', 14, v_id, 'Q'),
      ('ring-river-size-14', 15, v_id, 'R'),
      ('ring-river-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-river-specs',
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
    'ring-rosalia',
    'Rosalia',
    'Rosalia - Pear Claw Trilogy with Pear Side Stones and Floating Cathedral High Setting Engagement Ring',
    'Rosalia is an exquisite 5-claw pear trilogy showcasing a beautiful pear cut centre stone and two pear cut side stones atop a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rosalia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rosalia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosalia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosalia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosalia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosalia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rosalia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rosalia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rosalia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rosalia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosalia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rosalia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rosalia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rosalia-size-0', 1, v_id, 'D'),
      ('ring-rosalia-size-1', 2, v_id, 'E'),
      ('ring-rosalia-size-2', 3, v_id, 'F'),
      ('ring-rosalia-size-3', 4, v_id, 'G'),
      ('ring-rosalia-size-4', 5, v_id, 'H'),
      ('ring-rosalia-size-5', 6, v_id, 'I'),
      ('ring-rosalia-size-6', 7, v_id, 'J'),
      ('ring-rosalia-size-7', 8, v_id, 'K'),
      ('ring-rosalia-size-8', 9, v_id, 'L'),
      ('ring-rosalia-size-9', 10, v_id, 'M'),
      ('ring-rosalia-size-10', 11, v_id, 'N'),
      ('ring-rosalia-size-11', 12, v_id, 'O'),
      ('ring-rosalia-size-12', 13, v_id, 'P'),
      ('ring-rosalia-size-13', 14, v_id, 'Q'),
      ('ring-rosalia-size-14', 15, v_id, 'R'),
      ('ring-rosalia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rosalia-specs',
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
    'ring-rose',
    'Rose',
    'Rose - Fluted Cigar Ring',
    'The Rose wedding ring is a modern take on a croissant ring with a pillowy cigar band and stunning fluted design. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rose';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rose-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rose-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rose-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rose/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rose/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rose-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rose-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rose-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rose-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rose-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rose-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rose-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rose-size-0', 1, v_id, 'D'),
      ('ring-rose-size-1', 2, v_id, 'E'),
      ('ring-rose-size-2', 3, v_id, 'F'),
      ('ring-rose-size-3', 4, v_id, 'G'),
      ('ring-rose-size-4', 5, v_id, 'H'),
      ('ring-rose-size-5', 6, v_id, 'I'),
      ('ring-rose-size-6', 7, v_id, 'J'),
      ('ring-rose-size-7', 8, v_id, 'K'),
      ('ring-rose-size-8', 9, v_id, 'L'),
      ('ring-rose-size-9', 10, v_id, 'M'),
      ('ring-rose-size-10', 11, v_id, 'N'),
      ('ring-rose-size-11', 12, v_id, 'O'),
      ('ring-rose-size-12', 13, v_id, 'P'),
      ('ring-rose-size-13', 14, v_id, 'Q'),
      ('ring-rose-size-14', 15, v_id, 'R'),
      ('ring-rose-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rose-specs',
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
    'ring-rosie',
    'Rosie',
    'Rosie - Cushion 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Rosie is a timeless cushion solitaire design complete with four eagle-tipped claws and a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rosie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rosie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rosie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rosie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rosie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rosie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rosie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rosie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rosie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rosie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rosie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rosie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rosie-size-0', 1, v_id, 'D'),
      ('ring-rosie-size-1', 2, v_id, 'E'),
      ('ring-rosie-size-2', 3, v_id, 'F'),
      ('ring-rosie-size-3', 4, v_id, 'G'),
      ('ring-rosie-size-4', 5, v_id, 'H'),
      ('ring-rosie-size-5', 6, v_id, 'I'),
      ('ring-rosie-size-6', 7, v_id, 'J'),
      ('ring-rosie-size-7', 8, v_id, 'K'),
      ('ring-rosie-size-8', 9, v_id, 'L'),
      ('ring-rosie-size-9', 10, v_id, 'M'),
      ('ring-rosie-size-10', 11, v_id, 'N'),
      ('ring-rosie-size-11', 12, v_id, 'O'),
      ('ring-rosie-size-12', 13, v_id, 'P'),
      ('ring-rosie-size-13', 14, v_id, 'Q'),
      ('ring-rosie-size-14', 15, v_id, 'R'),
      ('ring-rosie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rosie-specs',
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
    'ring-rowena',
    'Rowena',
    'Rowena - Emerald 4 Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'Rowena is a stunning 4-claw emerald solitaire featuring a sparkling hidden halo, sweeping cathedral arches and a 2/3 pavé band, creating an effortless combination of modern elegance. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-rowena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-rowena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rowena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-rowena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/rowena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/rowena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-rowena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-rowena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-rowena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-rowena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-rowena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-rowena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-rowena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-rowena-size-0', 1, v_id, 'D'),
      ('ring-rowena-size-1', 2, v_id, 'E'),
      ('ring-rowena-size-2', 3, v_id, 'F'),
      ('ring-rowena-size-3', 4, v_id, 'G'),
      ('ring-rowena-size-4', 5, v_id, 'H'),
      ('ring-rowena-size-5', 6, v_id, 'I'),
      ('ring-rowena-size-6', 7, v_id, 'J'),
      ('ring-rowena-size-7', 8, v_id, 'K'),
      ('ring-rowena-size-8', 9, v_id, 'L'),
      ('ring-rowena-size-9', 10, v_id, 'M'),
      ('ring-rowena-size-10', 11, v_id, 'N'),
      ('ring-rowena-size-11', 12, v_id, 'O'),
      ('ring-rowena-size-12', 13, v_id, 'P'),
      ('ring-rowena-size-13', 14, v_id, 'Q'),
      ('ring-rowena-size-14', 15, v_id, 'R'),
      ('ring-rowena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-rowena-specs',
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
    'ring-sadie',
    'Sadie',
    'Sadie - Elongated Cushion Claw Solitaire with Pear Accents and Round Shoulder Stones Engagement Ring',
    'Sadie is a graceful 4-claw elongated cushion trilogy design featuring a beautiful elongated cushion cut centre stone encapsulated in a tulip motif basket. The elongated shape of the marquise is perfectly complimented by its shouldered pear and round cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sadie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sadie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sadie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sadie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sadie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sadie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sadie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sadie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sadie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sadie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sadie-size-0', 1, v_id, 'D'),
      ('ring-sadie-size-1', 2, v_id, 'E'),
      ('ring-sadie-size-2', 3, v_id, 'F'),
      ('ring-sadie-size-3', 4, v_id, 'G'),
      ('ring-sadie-size-4', 5, v_id, 'H'),
      ('ring-sadie-size-5', 6, v_id, 'I'),
      ('ring-sadie-size-6', 7, v_id, 'J'),
      ('ring-sadie-size-7', 8, v_id, 'K'),
      ('ring-sadie-size-8', 9, v_id, 'L'),
      ('ring-sadie-size-9', 10, v_id, 'M'),
      ('ring-sadie-size-10', 11, v_id, 'N'),
      ('ring-sadie-size-11', 12, v_id, 'O'),
      ('ring-sadie-size-12', 13, v_id, 'P'),
      ('ring-sadie-size-13', 14, v_id, 'Q'),
      ('ring-sadie-size-14', 15, v_id, 'R'),
      ('ring-sadie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sadie-specs',
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
    'ring-sage',
    'Sage',
    'Sage - Oval Bezel Solitaire Engagement Ring',
    'Sage is a stunning bezel-set oval solitaire paired with a minimal band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sage';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sage-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sage-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sage-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sage-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sage-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sage-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sage-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sage-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sage-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sage-size-0', 1, v_id, 'D'),
      ('ring-sage-size-1', 2, v_id, 'E'),
      ('ring-sage-size-2', 3, v_id, 'F'),
      ('ring-sage-size-3', 4, v_id, 'G'),
      ('ring-sage-size-4', 5, v_id, 'H'),
      ('ring-sage-size-5', 6, v_id, 'I'),
      ('ring-sage-size-6', 7, v_id, 'J'),
      ('ring-sage-size-7', 8, v_id, 'K'),
      ('ring-sage-size-8', 9, v_id, 'L'),
      ('ring-sage-size-9', 10, v_id, 'M'),
      ('ring-sage-size-10', 11, v_id, 'N'),
      ('ring-sage-size-11', 12, v_id, 'O'),
      ('ring-sage-size-12', 13, v_id, 'P'),
      ('ring-sage-size-13', 14, v_id, 'Q'),
      ('ring-sage-size-14', 15, v_id, 'R'),
      ('ring-sage-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sage-specs',
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
    'ring-salma',
    'Salma',
    'Salma - Marquise and Pear Claw Toi et Moi with Open Band Engagement Ring',
    'Salma''s distinct pear and marquise duo is elevated with a beautiful open band in this iconic toi et moi engagement ring. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-salma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-salma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-salma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-salma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-salma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-salma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-salma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-salma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-salma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-salma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-salma-size-0', 1, v_id, 'D'),
      ('ring-salma-size-1', 2, v_id, 'E'),
      ('ring-salma-size-2', 3, v_id, 'F'),
      ('ring-salma-size-3', 4, v_id, 'G'),
      ('ring-salma-size-4', 5, v_id, 'H'),
      ('ring-salma-size-5', 6, v_id, 'I'),
      ('ring-salma-size-6', 7, v_id, 'J'),
      ('ring-salma-size-7', 8, v_id, 'K'),
      ('ring-salma-size-8', 9, v_id, 'L'),
      ('ring-salma-size-9', 10, v_id, 'M'),
      ('ring-salma-size-10', 11, v_id, 'N'),
      ('ring-salma-size-11', 12, v_id, 'O'),
      ('ring-salma-size-12', 13, v_id, 'P'),
      ('ring-salma-size-13', 14, v_id, 'Q'),
      ('ring-salma-size-14', 15, v_id, 'R'),
      ('ring-salma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-salma-specs',
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
    'ring-sasha',
    'Sasha',
    'Sasha - Oval 8 Double Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'The Sasha engagement ring is a striking oval solitaire featuring four double-tipped claws, a hidden halo and 2/3 pavé cathedral band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sasha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sasha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sasha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sasha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sasha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sasha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sasha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sasha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sasha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sasha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sasha-size-0', 1, v_id, 'D'),
      ('ring-sasha-size-1', 2, v_id, 'E'),
      ('ring-sasha-size-2', 3, v_id, 'F'),
      ('ring-sasha-size-3', 4, v_id, 'G'),
      ('ring-sasha-size-4', 5, v_id, 'H'),
      ('ring-sasha-size-5', 6, v_id, 'I'),
      ('ring-sasha-size-6', 7, v_id, 'J'),
      ('ring-sasha-size-7', 8, v_id, 'K'),
      ('ring-sasha-size-8', 9, v_id, 'L'),
      ('ring-sasha-size-9', 10, v_id, 'M'),
      ('ring-sasha-size-10', 11, v_id, 'N'),
      ('ring-sasha-size-11', 12, v_id, 'O'),
      ('ring-sasha-size-12', 13, v_id, 'P'),
      ('ring-sasha-size-13', 14, v_id, 'Q'),
      ('ring-sasha-size-14', 15, v_id, 'R'),
      ('ring-sasha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sasha-specs',
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
    'ring-savannah',
    'Savannah',
    'Savannah - Oval 4 Claw Solitaire with Double Sunburst Halo and Cathedral Setting Engagement Ring',
    'Savannah is a spectacular engagement ring featuring an oval cut centre stone framed by a charming halo, intricately set with an array of round cut accent stones and complete with a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-savannah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-savannah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-savannah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-savannah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-savannah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-savannah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-savannah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-savannah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-savannah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-savannah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-savannah-size-0', 1, v_id, 'D'),
      ('ring-savannah-size-1', 2, v_id, 'E'),
      ('ring-savannah-size-2', 3, v_id, 'F'),
      ('ring-savannah-size-3', 4, v_id, 'G'),
      ('ring-savannah-size-4', 5, v_id, 'H'),
      ('ring-savannah-size-5', 6, v_id, 'I'),
      ('ring-savannah-size-6', 7, v_id, 'J'),
      ('ring-savannah-size-7', 8, v_id, 'K'),
      ('ring-savannah-size-8', 9, v_id, 'L'),
      ('ring-savannah-size-9', 10, v_id, 'M'),
      ('ring-savannah-size-10', 11, v_id, 'N'),
      ('ring-savannah-size-11', 12, v_id, 'O'),
      ('ring-savannah-size-12', 13, v_id, 'P'),
      ('ring-savannah-size-13', 14, v_id, 'Q'),
      ('ring-savannah-size-14', 15, v_id, 'R'),
      ('ring-savannah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-savannah-specs',
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
    'ring-scarlett',
    'Scarlett',
    'Scarlett - Oval 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'The elegant Scarlett engagement ring elevates the simple 4-claw oval solitaire design with a hidden halo and beautiful cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-scarlett';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-scarlett-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/scarlett/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/scarlett/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-scarlett-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/scarlett/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/scarlett/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-scarlett-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/scarlett/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/scarlett/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-scarlett-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-scarlett-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-scarlett-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-scarlett-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-scarlett-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-scarlett-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-scarlett-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-scarlett-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-scarlett-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-scarlett-size-0', 1, v_id, 'D'),
      ('ring-scarlett-size-1', 2, v_id, 'E'),
      ('ring-scarlett-size-2', 3, v_id, 'F'),
      ('ring-scarlett-size-3', 4, v_id, 'G'),
      ('ring-scarlett-size-4', 5, v_id, 'H'),
      ('ring-scarlett-size-5', 6, v_id, 'I'),
      ('ring-scarlett-size-6', 7, v_id, 'J'),
      ('ring-scarlett-size-7', 8, v_id, 'K'),
      ('ring-scarlett-size-8', 9, v_id, 'L'),
      ('ring-scarlett-size-9', 10, v_id, 'M'),
      ('ring-scarlett-size-10', 11, v_id, 'N'),
      ('ring-scarlett-size-11', 12, v_id, 'O'),
      ('ring-scarlett-size-12', 13, v_id, 'P'),
      ('ring-scarlett-size-13', 14, v_id, 'Q'),
      ('ring-scarlett-size-14', 15, v_id, 'R'),
      ('ring-scarlett-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-scarlett-specs',
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
    'ring-selena',
    'Selena',
    'Selena - Cushion 4 Claw Trilogy with Pear Side Stones and Open Trellis Gallery Engagement Ring',
    'Selena is a classic cushion trilogy adorned with two pear cut side stones and a beautiful woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-selena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-selena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/selena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/selena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-selena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/selena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/selena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-selena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/selena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/selena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-selena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-selena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-selena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-selena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-selena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-selena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-selena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-selena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-selena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-selena-size-0', 1, v_id, 'D'),
      ('ring-selena-size-1', 2, v_id, 'E'),
      ('ring-selena-size-2', 3, v_id, 'F'),
      ('ring-selena-size-3', 4, v_id, 'G'),
      ('ring-selena-size-4', 5, v_id, 'H'),
      ('ring-selena-size-5', 6, v_id, 'I'),
      ('ring-selena-size-6', 7, v_id, 'J'),
      ('ring-selena-size-7', 8, v_id, 'K'),
      ('ring-selena-size-8', 9, v_id, 'L'),
      ('ring-selena-size-9', 10, v_id, 'M'),
      ('ring-selena-size-10', 11, v_id, 'N'),
      ('ring-selena-size-11', 12, v_id, 'O'),
      ('ring-selena-size-12', 13, v_id, 'P'),
      ('ring-selena-size-13', 14, v_id, 'Q'),
      ('ring-selena-size-14', 15, v_id, 'R'),
      ('ring-selena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-selena-specs',
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
    'ring-sena',
    'Sena',
    'Sena - Marquise 4 Claw Solitaire with Bypass Band Engagement Ring',
    'Sena features a marquise centre stone framed by an open bypass band. Subtle outward curves follow and contrast the stone’s shape, giving the design a sense of movement and quiet structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sena-size-0', 1, v_id, 'D'),
      ('ring-sena-size-1', 2, v_id, 'E'),
      ('ring-sena-size-2', 3, v_id, 'F'),
      ('ring-sena-size-3', 4, v_id, 'G'),
      ('ring-sena-size-4', 5, v_id, 'H'),
      ('ring-sena-size-5', 6, v_id, 'I'),
      ('ring-sena-size-6', 7, v_id, 'J'),
      ('ring-sena-size-7', 8, v_id, 'K'),
      ('ring-sena-size-8', 9, v_id, 'L'),
      ('ring-sena-size-9', 10, v_id, 'M'),
      ('ring-sena-size-10', 11, v_id, 'N'),
      ('ring-sena-size-11', 12, v_id, 'O'),
      ('ring-sena-size-12', 13, v_id, 'P'),
      ('ring-sena-size-13', 14, v_id, 'Q'),
      ('ring-sena-size-14', 15, v_id, 'R'),
      ('ring-sena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sena-specs',
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
    'ring-shai',
    'Shai',
    'Shai - Pear East West Claw Solitaire with Wave Band Engagement Ring',
    'Shai features a stunning 3-claw pear solitaire resting within a uniquely curved band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-shai';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-shai-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shai/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-shai-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shai/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-shai-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shai/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shai/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shai-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-shai-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-shai-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-shai-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shai-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-shai-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shai-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-shai-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-shai-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-shai-size-0', 1, v_id, 'D'),
      ('ring-shai-size-1', 2, v_id, 'E'),
      ('ring-shai-size-2', 3, v_id, 'F'),
      ('ring-shai-size-3', 4, v_id, 'G'),
      ('ring-shai-size-4', 5, v_id, 'H'),
      ('ring-shai-size-5', 6, v_id, 'I'),
      ('ring-shai-size-6', 7, v_id, 'J'),
      ('ring-shai-size-7', 8, v_id, 'K'),
      ('ring-shai-size-8', 9, v_id, 'L'),
      ('ring-shai-size-9', 10, v_id, 'M'),
      ('ring-shai-size-10', 11, v_id, 'N'),
      ('ring-shai-size-11', 12, v_id, 'O'),
      ('ring-shai-size-12', 13, v_id, 'P'),
      ('ring-shai-size-13', 14, v_id, 'Q'),
      ('ring-shai-size-14', 15, v_id, 'R'),
      ('ring-shai-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-shai-specs',
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
    'ring-sharon',
    'Sharon',
    'Sharon - Oval 4 Claw Solitaire with Round Shoulder Stones Engagement Ring',
    'Sharon is an elegant, vintage-style oval solitaire balanced with six accent stones set low in a basket setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sharon';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sharon-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sharon/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sharon/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sharon-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sharon/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sharon/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sharon-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sharon/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sharon/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sharon-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sharon-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sharon-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sharon-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sharon-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sharon-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sharon-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sharon-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sharon-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sharon-size-0', 1, v_id, 'D'),
      ('ring-sharon-size-1', 2, v_id, 'E'),
      ('ring-sharon-size-2', 3, v_id, 'F'),
      ('ring-sharon-size-3', 4, v_id, 'G'),
      ('ring-sharon-size-4', 5, v_id, 'H'),
      ('ring-sharon-size-5', 6, v_id, 'I'),
      ('ring-sharon-size-6', 7, v_id, 'J'),
      ('ring-sharon-size-7', 8, v_id, 'K'),
      ('ring-sharon-size-8', 9, v_id, 'L'),
      ('ring-sharon-size-9', 10, v_id, 'M'),
      ('ring-sharon-size-10', 11, v_id, 'N'),
      ('ring-sharon-size-11', 12, v_id, 'O'),
      ('ring-sharon-size-12', 13, v_id, 'P'),
      ('ring-sharon-size-13', 14, v_id, 'Q'),
      ('ring-sharon-size-14', 15, v_id, 'R'),
      ('ring-sharon-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sharon-specs',
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
    'ring-shelly',
    'Shelly',
    'Shelly - Oval Claw Solitaire with Bead Set Pave Wave Band and East West Setting Engagement Ring',
    'Shelly is a contemporary design featuring an oval centre stone held in four claws. A sculptural wave band curves beneath, with bead pavé detailing tracing the upper half of the band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-shelly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-shelly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shelly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shelly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-shelly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shelly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shelly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-shelly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/shelly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/shelly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shelly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-shelly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-shelly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-shelly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shelly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-shelly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-shelly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-shelly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-shelly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-shelly-size-0', 1, v_id, 'D'),
      ('ring-shelly-size-1', 2, v_id, 'E'),
      ('ring-shelly-size-2', 3, v_id, 'F'),
      ('ring-shelly-size-3', 4, v_id, 'G'),
      ('ring-shelly-size-4', 5, v_id, 'H'),
      ('ring-shelly-size-5', 6, v_id, 'I'),
      ('ring-shelly-size-6', 7, v_id, 'J'),
      ('ring-shelly-size-7', 8, v_id, 'K'),
      ('ring-shelly-size-8', 9, v_id, 'L'),
      ('ring-shelly-size-9', 10, v_id, 'M'),
      ('ring-shelly-size-10', 11, v_id, 'N'),
      ('ring-shelly-size-11', 12, v_id, 'O'),
      ('ring-shelly-size-12', 13, v_id, 'P'),
      ('ring-shelly-size-13', 14, v_id, 'Q'),
      ('ring-shelly-size-14', 15, v_id, 'R'),
      ('ring-shelly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-shelly-specs',
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
    'ring-sheridan',
    'Sheridan',
    'Sheridan - Oval 4 Claw Solitaire with Pear Accents and Round Shoulder Stones Engagement Ring',
    'Sheridan is an elegant 4-claw oval trilogy design featuring an oval cut centre stone shouldered by pear and round cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sheridan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sheridan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sheridan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sheridan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sheridan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sheridan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sheridan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sheridan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sheridan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sheridan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sheridan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sheridan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sheridan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sheridan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sheridan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sheridan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sheridan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sheridan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sheridan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sheridan-size-0', 1, v_id, 'D'),
      ('ring-sheridan-size-1', 2, v_id, 'E'),
      ('ring-sheridan-size-2', 3, v_id, 'F'),
      ('ring-sheridan-size-3', 4, v_id, 'G'),
      ('ring-sheridan-size-4', 5, v_id, 'H'),
      ('ring-sheridan-size-5', 6, v_id, 'I'),
      ('ring-sheridan-size-6', 7, v_id, 'J'),
      ('ring-sheridan-size-7', 8, v_id, 'K'),
      ('ring-sheridan-size-8', 9, v_id, 'L'),
      ('ring-sheridan-size-9', 10, v_id, 'M'),
      ('ring-sheridan-size-10', 11, v_id, 'N'),
      ('ring-sheridan-size-11', 12, v_id, 'O'),
      ('ring-sheridan-size-12', 13, v_id, 'P'),
      ('ring-sheridan-size-13', 14, v_id, 'Q'),
      ('ring-sheridan-size-14', 15, v_id, 'R'),
      ('ring-sheridan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sheridan-specs',
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
    'ring-sherry',
    'Sherry',
    'Sherry - Marquise 4 Claw Solitaire Engagement Ring',
    'The Sherry engagement ring features a breathtaking marquise cut centre stone bordered by a combination of round claws and v-claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sherry';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sherry-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sherry/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sherry/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sherry-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sherry/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sherry/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sherry-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sherry/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sherry/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sherry-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sherry-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sherry-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sherry-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sherry-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sherry-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sherry-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sherry-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sherry-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sherry-size-0', 1, v_id, 'D'),
      ('ring-sherry-size-1', 2, v_id, 'E'),
      ('ring-sherry-size-2', 3, v_id, 'F'),
      ('ring-sherry-size-3', 4, v_id, 'G'),
      ('ring-sherry-size-4', 5, v_id, 'H'),
      ('ring-sherry-size-5', 6, v_id, 'I'),
      ('ring-sherry-size-6', 7, v_id, 'J'),
      ('ring-sherry-size-7', 8, v_id, 'K'),
      ('ring-sherry-size-8', 9, v_id, 'L'),
      ('ring-sherry-size-9', 10, v_id, 'M'),
      ('ring-sherry-size-10', 11, v_id, 'N'),
      ('ring-sherry-size-11', 12, v_id, 'O'),
      ('ring-sherry-size-12', 13, v_id, 'P'),
      ('ring-sherry-size-13', 14, v_id, 'Q'),
      ('ring-sherry-size-14', 15, v_id, 'R'),
      ('ring-sherry-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sherry-specs',
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
    'ring-sierra',
    'Sierra',
    'Sierra - Oval Bezel Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Sierra is a modern interpretation of the bezel design, encapsulating an oval-cut centre stone within a deep setting. A hidden pavé detail sits within the bezel, supported by a cathedral foundation for balanced structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sierra';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sierra-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sierra/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sierra/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sierra-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sierra/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sierra/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sierra-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sierra/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sierra/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sierra-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sierra-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sierra-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sierra-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sierra-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sierra-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sierra-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sierra-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sierra-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sierra-size-0', 1, v_id, 'D'),
      ('ring-sierra-size-1', 2, v_id, 'E'),
      ('ring-sierra-size-2', 3, v_id, 'F'),
      ('ring-sierra-size-3', 4, v_id, 'G'),
      ('ring-sierra-size-4', 5, v_id, 'H'),
      ('ring-sierra-size-5', 6, v_id, 'I'),
      ('ring-sierra-size-6', 7, v_id, 'J'),
      ('ring-sierra-size-7', 8, v_id, 'K'),
      ('ring-sierra-size-8', 9, v_id, 'L'),
      ('ring-sierra-size-9', 10, v_id, 'M'),
      ('ring-sierra-size-10', 11, v_id, 'N'),
      ('ring-sierra-size-11', 12, v_id, 'O'),
      ('ring-sierra-size-12', 13, v_id, 'P'),
      ('ring-sierra-size-13', 14, v_id, 'Q'),
      ('ring-sierra-size-14', 15, v_id, 'R'),
      ('ring-sierra-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sierra-specs',
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
    'ring-silvana',
    'Silvana',
    'Silvana - Emerald 4 Claw Trilogy with Emerald Side Stones and Low Setting Engagement Ring',
    'Silvana is a timeless trilogy of emerald cut stones placed low in a beautiful basket setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-silvana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-silvana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/silvana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/silvana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-silvana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/silvana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/silvana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-silvana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/silvana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/silvana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-silvana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-silvana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-silvana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-silvana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-silvana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-silvana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-silvana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-silvana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-silvana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-silvana-size-0', 1, v_id, 'D'),
      ('ring-silvana-size-1', 2, v_id, 'E'),
      ('ring-silvana-size-2', 3, v_id, 'F'),
      ('ring-silvana-size-3', 4, v_id, 'G'),
      ('ring-silvana-size-4', 5, v_id, 'H'),
      ('ring-silvana-size-5', 6, v_id, 'I'),
      ('ring-silvana-size-6', 7, v_id, 'J'),
      ('ring-silvana-size-7', 8, v_id, 'K'),
      ('ring-silvana-size-8', 9, v_id, 'L'),
      ('ring-silvana-size-9', 10, v_id, 'M'),
      ('ring-silvana-size-10', 11, v_id, 'N'),
      ('ring-silvana-size-11', 12, v_id, 'O'),
      ('ring-silvana-size-12', 13, v_id, 'P'),
      ('ring-silvana-size-13', 14, v_id, 'Q'),
      ('ring-silvana-size-14', 15, v_id, 'R'),
      ('ring-silvana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-silvana-specs',
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

