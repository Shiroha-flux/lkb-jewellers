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