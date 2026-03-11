DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-liberty',
    'Liberty',
    'Liberty - Radiant 4 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'Liberty is a stunning solitaire design featuring a radiant cut centre stone, four eagle-tipped claws and a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-liberty';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-liberty-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-liberty-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-liberty-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/liberty/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/liberty/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-liberty-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-liberty-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-liberty-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-liberty-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-liberty-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-liberty-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-liberty-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-liberty-size-0', 1, v_id, 'D'),
      ('ring-liberty-size-1', 2, v_id, 'E'),
      ('ring-liberty-size-2', 3, v_id, 'F'),
      ('ring-liberty-size-3', 4, v_id, 'G'),
      ('ring-liberty-size-4', 5, v_id, 'H'),
      ('ring-liberty-size-5', 6, v_id, 'I'),
      ('ring-liberty-size-6', 7, v_id, 'J'),
      ('ring-liberty-size-7', 8, v_id, 'K'),
      ('ring-liberty-size-8', 9, v_id, 'L'),
      ('ring-liberty-size-9', 10, v_id, 'M'),
      ('ring-liberty-size-10', 11, v_id, 'N'),
      ('ring-liberty-size-11', 12, v_id, 'O'),
      ('ring-liberty-size-12', 13, v_id, 'P'),
      ('ring-liberty-size-13', 14, v_id, 'Q'),
      ('ring-liberty-size-14', 15, v_id, 'R'),
      ('ring-liberty-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-liberty-specs',
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
    'ring-lilly',
    'Lilly',
    'Lilly - Round 4 Claw Solitaire Engagement Ring',
    'Lilly is a timeless classic solitaire design featuring a beautiful round cut centre stone held in a delicate high-set 4-claw setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lilly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lilly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lilly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lilly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lilly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lilly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lilly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lilly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lilly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lilly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lilly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lilly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lilly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lilly-size-0', 1, v_id, 'D'),
      ('ring-lilly-size-1', 2, v_id, 'E'),
      ('ring-lilly-size-2', 3, v_id, 'F'),
      ('ring-lilly-size-3', 4, v_id, 'G'),
      ('ring-lilly-size-4', 5, v_id, 'H'),
      ('ring-lilly-size-5', 6, v_id, 'I'),
      ('ring-lilly-size-6', 7, v_id, 'J'),
      ('ring-lilly-size-7', 8, v_id, 'K'),
      ('ring-lilly-size-8', 9, v_id, 'L'),
      ('ring-lilly-size-9', 10, v_id, 'M'),
      ('ring-lilly-size-10', 11, v_id, 'N'),
      ('ring-lilly-size-11', 12, v_id, 'O'),
      ('ring-lilly-size-12', 13, v_id, 'P'),
      ('ring-lilly-size-13', 14, v_id, 'Q'),
      ('ring-lilly-size-14', 15, v_id, 'R'),
      ('ring-lilly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lilly-specs',
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
    'ring-lorelai',
    'Lorelai',
    'Lorelai - Round Claw Solitaire with Hidden Halo and Twisted Alternating Pave Band Engagement Ring',
    'Lorelai is an elegant twisted engagement ring displaying an interweaving half-circle of sleek pavé and polished metal, 4-claw round cut centre stone and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lorelai';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lorelai-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorelai-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorelai-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorelai/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorelai/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lorelai-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lorelai-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lorelai-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lorelai-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorelai-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lorelai-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lorelai-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lorelai-size-0', 1, v_id, 'D'),
      ('ring-lorelai-size-1', 2, v_id, 'E'),
      ('ring-lorelai-size-2', 3, v_id, 'F'),
      ('ring-lorelai-size-3', 4, v_id, 'G'),
      ('ring-lorelai-size-4', 5, v_id, 'H'),
      ('ring-lorelai-size-5', 6, v_id, 'I'),
      ('ring-lorelai-size-6', 7, v_id, 'J'),
      ('ring-lorelai-size-7', 8, v_id, 'K'),
      ('ring-lorelai-size-8', 9, v_id, 'L'),
      ('ring-lorelai-size-9', 10, v_id, 'M'),
      ('ring-lorelai-size-10', 11, v_id, 'N'),
      ('ring-lorelai-size-11', 12, v_id, 'O'),
      ('ring-lorelai-size-12', 13, v_id, 'P'),
      ('ring-lorelai-size-13', 14, v_id, 'Q'),
      ('ring-lorelai-size-14', 15, v_id, 'R'),
      ('ring-lorelai-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lorelai-specs',
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
    'ring-lorena',
    'Lorena',
    'Lorena - Round Claw Solitaire with Bypass Band and Clustered Round-Marquise Accent Stones Engagement Ring',
    'Lorena pairs a round centre stone with a contemporary bypass setting. Curved lines are finished with round and marquise accent stones creating an open, sculptural silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-lorena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-lorena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-lorena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/lorena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/lorena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-lorena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-lorena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-lorena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-lorena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-lorena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-lorena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-lorena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-lorena-size-0', 1, v_id, 'D'),
      ('ring-lorena-size-1', 2, v_id, 'E'),
      ('ring-lorena-size-2', 3, v_id, 'F'),
      ('ring-lorena-size-3', 4, v_id, 'G'),
      ('ring-lorena-size-4', 5, v_id, 'H'),
      ('ring-lorena-size-5', 6, v_id, 'I'),
      ('ring-lorena-size-6', 7, v_id, 'J'),
      ('ring-lorena-size-7', 8, v_id, 'K'),
      ('ring-lorena-size-8', 9, v_id, 'L'),
      ('ring-lorena-size-9', 10, v_id, 'M'),
      ('ring-lorena-size-10', 11, v_id, 'N'),
      ('ring-lorena-size-11', 12, v_id, 'O'),
      ('ring-lorena-size-12', 13, v_id, 'P'),
      ('ring-lorena-size-13', 14, v_id, 'Q'),
      ('ring-lorena-size-14', 15, v_id, 'R'),
      ('ring-lorena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-lorena-specs',
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
    'ring-louise',
    'Louise',
    'Louise - Round 6 Claw Solitaire Engagement Ring',
    'Louise is a classic solitaire engagement ring showcasing a stunning round cut centre stone held by six elegant eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-louise';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-louise-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-louise-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-louise-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/louise/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/louise/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-louise-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-louise-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-louise-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-louise-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-louise-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-louise-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-louise-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-louise-size-0', 1, v_id, 'D'),
      ('ring-louise-size-1', 2, v_id, 'E'),
      ('ring-louise-size-2', 3, v_id, 'F'),
      ('ring-louise-size-3', 4, v_id, 'G'),
      ('ring-louise-size-4', 5, v_id, 'H'),
      ('ring-louise-size-5', 6, v_id, 'I'),
      ('ring-louise-size-6', 7, v_id, 'J'),
      ('ring-louise-size-7', 8, v_id, 'K'),
      ('ring-louise-size-8', 9, v_id, 'L'),
      ('ring-louise-size-9', 10, v_id, 'M'),
      ('ring-louise-size-10', 11, v_id, 'N'),
      ('ring-louise-size-11', 12, v_id, 'O'),
      ('ring-louise-size-12', 13, v_id, 'P'),
      ('ring-louise-size-13', 14, v_id, 'Q'),
      ('ring-louise-size-14', 15, v_id, 'R'),
      ('ring-louise-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-louise-specs',
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