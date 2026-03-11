DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-halle',
    'Halle',
    'Halle - Round Claw Trilogy with Pear Side Stones and Knife Edge Band Engagement Ring',
    'Halle is an elegant trilogy ring with a round cut centre stone and pear cut side stones, finished within a graceful basket setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-halle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-halle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-halle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-halle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/halle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/halle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-halle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-halle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-halle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-halle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-halle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-halle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-halle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-halle-size-0', 1, v_id, 'D'),
      ('ring-halle-size-1', 2, v_id, 'E'),
      ('ring-halle-size-2', 3, v_id, 'F'),
      ('ring-halle-size-3', 4, v_id, 'G'),
      ('ring-halle-size-4', 5, v_id, 'H'),
      ('ring-halle-size-5', 6, v_id, 'I'),
      ('ring-halle-size-6', 7, v_id, 'J'),
      ('ring-halle-size-7', 8, v_id, 'K'),
      ('ring-halle-size-8', 9, v_id, 'L'),
      ('ring-halle-size-9', 10, v_id, 'M'),
      ('ring-halle-size-10', 11, v_id, 'N'),
      ('ring-halle-size-11', 12, v_id, 'O'),
      ('ring-halle-size-12', 13, v_id, 'P'),
      ('ring-halle-size-13', 14, v_id, 'Q'),
      ('ring-halle-size-14', 15, v_id, 'R'),
      ('ring-halle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-halle-specs',
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
    'ring-hannah',
    'Hannah',
    'Hannah - Marquise Claw Trilogy with Pear Side Stones and Hidden Halo Engagement Ring',
    'The Hannah engagement ring is a unique marquise trilogy ring, complete with two pear cut side stones and a hidden halo held within a cathedral setting on a slim tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hannah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hannah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hannah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hannah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hannah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hannah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hannah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hannah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hannah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hannah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hannah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hannah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hannah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hannah-size-0', 1, v_id, 'D'),
      ('ring-hannah-size-1', 2, v_id, 'E'),
      ('ring-hannah-size-2', 3, v_id, 'F'),
      ('ring-hannah-size-3', 4, v_id, 'G'),
      ('ring-hannah-size-4', 5, v_id, 'H'),
      ('ring-hannah-size-5', 6, v_id, 'I'),
      ('ring-hannah-size-6', 7, v_id, 'J'),
      ('ring-hannah-size-7', 8, v_id, 'K'),
      ('ring-hannah-size-8', 9, v_id, 'L'),
      ('ring-hannah-size-9', 10, v_id, 'M'),
      ('ring-hannah-size-10', 11, v_id, 'N'),
      ('ring-hannah-size-11', 12, v_id, 'O'),
      ('ring-hannah-size-12', 13, v_id, 'P'),
      ('ring-hannah-size-13', 14, v_id, 'Q'),
      ('ring-hannah-size-14', 15, v_id, 'R'),
      ('ring-hannah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hannah-specs',
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
    'ring-hayley',
    'Hayley',
    'Hayley - Oval 4 Claw Solitaire with Wave Band and East West Setting Engagement Ring',
    'Hayley features a beautiful 4-claw oval cut stone resting within a uniquely curved band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hayley';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hayley-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hayley-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hayley-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hayley/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hayley/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hayley-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hayley-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hayley-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hayley-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hayley-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hayley-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hayley-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hayley-size-0', 1, v_id, 'D'),
      ('ring-hayley-size-1', 2, v_id, 'E'),
      ('ring-hayley-size-2', 3, v_id, 'F'),
      ('ring-hayley-size-3', 4, v_id, 'G'),
      ('ring-hayley-size-4', 5, v_id, 'H'),
      ('ring-hayley-size-5', 6, v_id, 'I'),
      ('ring-hayley-size-6', 7, v_id, 'J'),
      ('ring-hayley-size-7', 8, v_id, 'K'),
      ('ring-hayley-size-8', 9, v_id, 'L'),
      ('ring-hayley-size-9', 10, v_id, 'M'),
      ('ring-hayley-size-10', 11, v_id, 'N'),
      ('ring-hayley-size-11', 12, v_id, 'O'),
      ('ring-hayley-size-12', 13, v_id, 'P'),
      ('ring-hayley-size-13', 14, v_id, 'Q'),
      ('ring-hayley-size-14', 15, v_id, 'R'),
      ('ring-hayley-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hayley-specs',
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
    'ring-hilary',
    'Hilary',
    'Hilary - Oval 4 Claw Solitaire with Cathedral High Setting Engagement Ring',
    'Hilary is a stunning oval solitaire engagement ring featuring a classic 4-claw setting complete with sweeping cathedral arches. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-hilary';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-hilary-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hilary-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-hilary-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/hilary/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/hilary/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-hilary-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-hilary-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-hilary-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-hilary-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-hilary-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-hilary-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-hilary-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-hilary-size-0', 1, v_id, 'D'),
      ('ring-hilary-size-1', 2, v_id, 'E'),
      ('ring-hilary-size-2', 3, v_id, 'F'),
      ('ring-hilary-size-3', 4, v_id, 'G'),
      ('ring-hilary-size-4', 5, v_id, 'H'),
      ('ring-hilary-size-5', 6, v_id, 'I'),
      ('ring-hilary-size-6', 7, v_id, 'J'),
      ('ring-hilary-size-7', 8, v_id, 'K'),
      ('ring-hilary-size-8', 9, v_id, 'L'),
      ('ring-hilary-size-9', 10, v_id, 'M'),
      ('ring-hilary-size-10', 11, v_id, 'N'),
      ('ring-hilary-size-11', 12, v_id, 'O'),
      ('ring-hilary-size-12', 13, v_id, 'P'),
      ('ring-hilary-size-13', 14, v_id, 'Q'),
      ('ring-hilary-size-14', 15, v_id, 'R'),
      ('ring-hilary-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-hilary-specs',
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
    'ring-iris',
    'Iris',
    'Iris - Round 6 Claw Solitaire with Petal Gallery Engagement Ring',
    'Clasped by six eagle-tipped claws, the Iris engagement ring displays a stunning round cut stone set high within a uniquely feminine petal setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-iris';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-iris-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-iris-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-iris-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/iris/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/iris/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-iris-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-iris-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-iris-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-iris-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-iris-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-iris-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-iris-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-iris-size-0', 1, v_id, 'D'),
      ('ring-iris-size-1', 2, v_id, 'E'),
      ('ring-iris-size-2', 3, v_id, 'F'),
      ('ring-iris-size-3', 4, v_id, 'G'),
      ('ring-iris-size-4', 5, v_id, 'H'),
      ('ring-iris-size-5', 6, v_id, 'I'),
      ('ring-iris-size-6', 7, v_id, 'J'),
      ('ring-iris-size-7', 8, v_id, 'K'),
      ('ring-iris-size-8', 9, v_id, 'L'),
      ('ring-iris-size-9', 10, v_id, 'M'),
      ('ring-iris-size-10', 11, v_id, 'N'),
      ('ring-iris-size-11', 12, v_id, 'O'),
      ('ring-iris-size-12', 13, v_id, 'P'),
      ('ring-iris-size-13', 14, v_id, 'Q'),
      ('ring-iris-size-14', 15, v_id, 'R'),
      ('ring-iris-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-iris-specs',
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