DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-melody',
    'Melody',
    'Melody - Radiant 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Melody features a radiant-cut centre stone held in a refined four-claw setting, with a discreet hidden halo and cathedral foundation adding balance and elevation. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-melody';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-melody-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/melody/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/melody/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-melody-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/melody/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/melody/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-melody-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/melody/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/melody/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-melody-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-melody-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-melody-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-melody-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-melody-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-melody-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-melody-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-melody-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-melody-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-melody-size-0', 1, v_id, 'D'),
      ('ring-melody-size-1', 2, v_id, 'E'),
      ('ring-melody-size-2', 3, v_id, 'F'),
      ('ring-melody-size-3', 4, v_id, 'G'),
      ('ring-melody-size-4', 5, v_id, 'H'),
      ('ring-melody-size-5', 6, v_id, 'I'),
      ('ring-melody-size-6', 7, v_id, 'J'),
      ('ring-melody-size-7', 8, v_id, 'K'),
      ('ring-melody-size-8', 9, v_id, 'L'),
      ('ring-melody-size-9', 10, v_id, 'M'),
      ('ring-melody-size-10', 11, v_id, 'N'),
      ('ring-melody-size-11', 12, v_id, 'O'),
      ('ring-melody-size-12', 13, v_id, 'P'),
      ('ring-melody-size-13', 14, v_id, 'Q'),
      ('ring-melody-size-14', 15, v_id, 'R'),
      ('ring-melody-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-melody-specs',
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
    'ring-merida',
    'Merida',
    'Merida - Elongated Cushion Claw Solitaire with Bypass Band and Clustered Round-Marquise Accent Stones Engagement Ring',
    'Merida pairs an elongated cushion-cut centre stone with a contemporary bypass setting. Curved lines are finished with round and marquise accent stones creating an open, sculptural silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-merida';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-merida-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/merida/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/merida/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-merida-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/merida/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/merida/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-merida-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/merida/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/merida/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-merida-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-merida-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-merida-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-merida-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-merida-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-merida-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-merida-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-merida-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-merida-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-merida-size-0', 1, v_id, 'D'),
      ('ring-merida-size-1', 2, v_id, 'E'),
      ('ring-merida-size-2', 3, v_id, 'F'),
      ('ring-merida-size-3', 4, v_id, 'G'),
      ('ring-merida-size-4', 5, v_id, 'H'),
      ('ring-merida-size-5', 6, v_id, 'I'),
      ('ring-merida-size-6', 7, v_id, 'J'),
      ('ring-merida-size-7', 8, v_id, 'K'),
      ('ring-merida-size-8', 9, v_id, 'L'),
      ('ring-merida-size-9', 10, v_id, 'M'),
      ('ring-merida-size-10', 11, v_id, 'N'),
      ('ring-merida-size-11', 12, v_id, 'O'),
      ('ring-merida-size-12', 13, v_id, 'P'),
      ('ring-merida-size-13', 14, v_id, 'Q'),
      ('ring-merida-size-14', 15, v_id, 'R'),
      ('ring-merida-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-merida-specs',
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
    'ring-mia',
    'Mia',
    'Mia - Pear Claw Trilogy with Pear Side Stones, Pave Band and Cathedral High Setting Engagement Ring',
    'With a striking pear cut centre stone, the Mia design features two neighbouring pear cut stones held in a stunning 5-claw cathedral setting atop a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-mia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-mia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-mia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/mia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/mia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-mia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-mia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-mia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-mia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-mia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-mia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-mia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-mia-size-0', 1, v_id, 'D'),
      ('ring-mia-size-1', 2, v_id, 'E'),
      ('ring-mia-size-2', 3, v_id, 'F'),
      ('ring-mia-size-3', 4, v_id, 'G'),
      ('ring-mia-size-4', 5, v_id, 'H'),
      ('ring-mia-size-5', 6, v_id, 'I'),
      ('ring-mia-size-6', 7, v_id, 'J'),
      ('ring-mia-size-7', 8, v_id, 'K'),
      ('ring-mia-size-8', 9, v_id, 'L'),
      ('ring-mia-size-9', 10, v_id, 'M'),
      ('ring-mia-size-10', 11, v_id, 'N'),
      ('ring-mia-size-11', 12, v_id, 'O'),
      ('ring-mia-size-12', 13, v_id, 'P'),
      ('ring-mia-size-13', 14, v_id, 'Q'),
      ('ring-mia-size-14', 15, v_id, 'R'),
      ('ring-mia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-mia-specs',
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
    'ring-miller',
    'Miller',
    'Miller - Emerald 4 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The Miller engagement ring showcases a stunning emerald cut solitaire enclosed by a 4-claw setting and completed with a wrap-around hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-miller';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-miller-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/miller/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/miller/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-miller-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/miller/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/miller/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-miller-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/miller/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/miller/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-miller-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-miller-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-miller-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-miller-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-miller-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-miller-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-miller-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-miller-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-miller-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-miller-size-0', 1, v_id, 'D'),
      ('ring-miller-size-1', 2, v_id, 'E'),
      ('ring-miller-size-2', 3, v_id, 'F'),
      ('ring-miller-size-3', 4, v_id, 'G'),
      ('ring-miller-size-4', 5, v_id, 'H'),
      ('ring-miller-size-5', 6, v_id, 'I'),
      ('ring-miller-size-6', 7, v_id, 'J'),
      ('ring-miller-size-7', 8, v_id, 'K'),
      ('ring-miller-size-8', 9, v_id, 'L'),
      ('ring-miller-size-9', 10, v_id, 'M'),
      ('ring-miller-size-10', 11, v_id, 'N'),
      ('ring-miller-size-11', 12, v_id, 'O'),
      ('ring-miller-size-12', 13, v_id, 'P'),
      ('ring-miller-size-13', 14, v_id, 'Q'),
      ('ring-miller-size-14', 15, v_id, 'R'),
      ('ring-miller-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-miller-specs',
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
    'ring-molly',
    'Molly',
    'Molly - Round 6 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Featuring a dazzling round cut centre stone, the centrepiece of the Molly design is neighboured by ten delicate accent stones in a low-set basket setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-molly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-molly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/molly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/molly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-molly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/molly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/molly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-molly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/molly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/molly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-molly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-molly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-molly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-molly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-molly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-molly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-molly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-molly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-molly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-molly-size-0', 1, v_id, 'D'),
      ('ring-molly-size-1', 2, v_id, 'E'),
      ('ring-molly-size-2', 3, v_id, 'F'),
      ('ring-molly-size-3', 4, v_id, 'G'),
      ('ring-molly-size-4', 5, v_id, 'H'),
      ('ring-molly-size-5', 6, v_id, 'I'),
      ('ring-molly-size-6', 7, v_id, 'J'),
      ('ring-molly-size-7', 8, v_id, 'K'),
      ('ring-molly-size-8', 9, v_id, 'L'),
      ('ring-molly-size-9', 10, v_id, 'M'),
      ('ring-molly-size-10', 11, v_id, 'N'),
      ('ring-molly-size-11', 12, v_id, 'O'),
      ('ring-molly-size-12', 13, v_id, 'P'),
      ('ring-molly-size-13', 14, v_id, 'Q'),
      ('ring-molly-size-14', 15, v_id, 'R'),
      ('ring-molly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-molly-specs',
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