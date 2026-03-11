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