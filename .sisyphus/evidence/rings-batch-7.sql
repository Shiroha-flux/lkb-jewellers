DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-aster',
    'Aster',
    'Aster - Radiant Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Aster centres a radiant stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aster';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aster-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aster-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aster-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aster/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aster/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aster-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aster-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aster-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aster-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aster-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aster-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aster-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aster-size-0', 1, v_id, 'D'),
      ('ring-aster-size-1', 2, v_id, 'E'),
      ('ring-aster-size-2', 3, v_id, 'F'),
      ('ring-aster-size-3', 4, v_id, 'G'),
      ('ring-aster-size-4', 5, v_id, 'H'),
      ('ring-aster-size-5', 6, v_id, 'I'),
      ('ring-aster-size-6', 7, v_id, 'J'),
      ('ring-aster-size-7', 8, v_id, 'K'),
      ('ring-aster-size-8', 9, v_id, 'L'),
      ('ring-aster-size-9', 10, v_id, 'M'),
      ('ring-aster-size-10', 11, v_id, 'N'),
      ('ring-aster-size-11', 12, v_id, 'O'),
      ('ring-aster-size-12', 13, v_id, 'P'),
      ('ring-aster-size-13', 14, v_id, 'Q'),
      ('ring-aster-size-14', 15, v_id, 'R'),
      ('ring-aster-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aster-specs',
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
    'ring-athena',
    'Athena',
    'Athena - Oval Claw Solitaire with Double Plain-and-Round-Accent Stones Band Engagement Ring',
    'Graceful yet bold, the Athena engagement ring features a beautiful oval cut centre stone, double band design and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-athena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-athena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-athena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-athena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/athena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/athena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-athena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-athena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-athena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-athena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-athena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-athena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-athena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-athena-size-0', 1, v_id, 'D'),
      ('ring-athena-size-1', 2, v_id, 'E'),
      ('ring-athena-size-2', 3, v_id, 'F'),
      ('ring-athena-size-3', 4, v_id, 'G'),
      ('ring-athena-size-4', 5, v_id, 'H'),
      ('ring-athena-size-5', 6, v_id, 'I'),
      ('ring-athena-size-6', 7, v_id, 'J'),
      ('ring-athena-size-7', 8, v_id, 'K'),
      ('ring-athena-size-8', 9, v_id, 'L'),
      ('ring-athena-size-9', 10, v_id, 'M'),
      ('ring-athena-size-10', 11, v_id, 'N'),
      ('ring-athena-size-11', 12, v_id, 'O'),
      ('ring-athena-size-12', 13, v_id, 'P'),
      ('ring-athena-size-13', 14, v_id, 'Q'),
      ('ring-athena-size-14', 15, v_id, 'R'),
      ('ring-athena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-athena-specs',
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
    'ring-aubrey',
    'Aubrey',
    'Aubrey - Elongated Cushion 4 Double Claw Solitaire with Hidden Halo Engagement Ring',
    'The Aubrey engagement ring adds a unique touch to the classic elongated solitaire style with a double-tipped 4-claw setting and sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aubrey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aubrey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aubrey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aubrey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aubrey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aubrey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aubrey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aubrey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aubrey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aubrey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aubrey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aubrey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aubrey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aubrey-size-0', 1, v_id, 'D'),
      ('ring-aubrey-size-1', 2, v_id, 'E'),
      ('ring-aubrey-size-2', 3, v_id, 'F'),
      ('ring-aubrey-size-3', 4, v_id, 'G'),
      ('ring-aubrey-size-4', 5, v_id, 'H'),
      ('ring-aubrey-size-5', 6, v_id, 'I'),
      ('ring-aubrey-size-6', 7, v_id, 'J'),
      ('ring-aubrey-size-7', 8, v_id, 'K'),
      ('ring-aubrey-size-8', 9, v_id, 'L'),
      ('ring-aubrey-size-9', 10, v_id, 'M'),
      ('ring-aubrey-size-10', 11, v_id, 'N'),
      ('ring-aubrey-size-11', 12, v_id, 'O'),
      ('ring-aubrey-size-12', 13, v_id, 'P'),
      ('ring-aubrey-size-13', 14, v_id, 'Q'),
      ('ring-aubrey-size-14', 15, v_id, 'R'),
      ('ring-aubrey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aubrey-specs',
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
    'ring-aurelie',
    'Aurelie',
    'Aurelie - Oval Claw Solitaire with Petal Gallery and Accent Leaf Detail Engagement Ring',
    'Aurelie is a 4-claw oval that offers a twist on a classic solitaire with an accented petal gallery. Emphasising beauty in the smallest details, a secret hidden halo is encased within the petite petals, offering support for a subtle yet elegant form. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-aurelie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-aurelie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aurelie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-aurelie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/aurelie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/aurelie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-aurelie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-aurelie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-aurelie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-aurelie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-aurelie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-aurelie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-aurelie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-aurelie-size-0', 1, v_id, 'D'),
      ('ring-aurelie-size-1', 2, v_id, 'E'),
      ('ring-aurelie-size-2', 3, v_id, 'F'),
      ('ring-aurelie-size-3', 4, v_id, 'G'),
      ('ring-aurelie-size-4', 5, v_id, 'H'),
      ('ring-aurelie-size-5', 6, v_id, 'I'),
      ('ring-aurelie-size-6', 7, v_id, 'J'),
      ('ring-aurelie-size-7', 8, v_id, 'K'),
      ('ring-aurelie-size-8', 9, v_id, 'L'),
      ('ring-aurelie-size-9', 10, v_id, 'M'),
      ('ring-aurelie-size-10', 11, v_id, 'N'),
      ('ring-aurelie-size-11', 12, v_id, 'O'),
      ('ring-aurelie-size-12', 13, v_id, 'P'),
      ('ring-aurelie-size-13', 14, v_id, 'Q'),
      ('ring-aurelie-size-14', 15, v_id, 'R'),
      ('ring-aurelie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-aurelie-specs',
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
    'ring-ava',
    'Ava',
    'Ava - Elongated Cushion 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Ava is a popular cushion solitaire design complete with a sparkling hidden halo, 4-claw setting and slim band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ava';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ava-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ava-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ava-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ava/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ava/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ava-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ava-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ava-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ava-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ava-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ava-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ava-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ava-size-0', 1, v_id, 'D'),
      ('ring-ava-size-1', 2, v_id, 'E'),
      ('ring-ava-size-2', 3, v_id, 'F'),
      ('ring-ava-size-3', 4, v_id, 'G'),
      ('ring-ava-size-4', 5, v_id, 'H'),
      ('ring-ava-size-5', 6, v_id, 'I'),
      ('ring-ava-size-6', 7, v_id, 'J'),
      ('ring-ava-size-7', 8, v_id, 'K'),
      ('ring-ava-size-8', 9, v_id, 'L'),
      ('ring-ava-size-9', 10, v_id, 'M'),
      ('ring-ava-size-10', 11, v_id, 'N'),
      ('ring-ava-size-11', 12, v_id, 'O'),
      ('ring-ava-size-12', 13, v_id, 'P'),
      ('ring-ava-size-13', 14, v_id, 'Q'),
      ('ring-ava-size-14', 15, v_id, 'R'),
      ('ring-ava-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ava-specs',
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