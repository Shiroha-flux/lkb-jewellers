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