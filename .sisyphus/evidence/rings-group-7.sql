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

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-morgan',
    'Morgan',
    'Morgan - Pear and Radiant Claw Toi et Moi Engagement Ring',
    'Morgan is a stunning duo of pear cut and radiant cut stones, held in a beautiful toi et moi setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-morgan';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-morgan-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/morgan/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/morgan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-morgan-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/morgan/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/morgan/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-morgan-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/morgan/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/morgan/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-morgan-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-morgan-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-morgan-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-morgan-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-morgan-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-morgan-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-morgan-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-morgan-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-morgan-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-morgan-size-0', 1, v_id, 'D'),
      ('ring-morgan-size-1', 2, v_id, 'E'),
      ('ring-morgan-size-2', 3, v_id, 'F'),
      ('ring-morgan-size-3', 4, v_id, 'G'),
      ('ring-morgan-size-4', 5, v_id, 'H'),
      ('ring-morgan-size-5', 6, v_id, 'I'),
      ('ring-morgan-size-6', 7, v_id, 'J'),
      ('ring-morgan-size-7', 8, v_id, 'K'),
      ('ring-morgan-size-8', 9, v_id, 'L'),
      ('ring-morgan-size-9', 10, v_id, 'M'),
      ('ring-morgan-size-10', 11, v_id, 'N'),
      ('ring-morgan-size-11', 12, v_id, 'O'),
      ('ring-morgan-size-12', 13, v_id, 'P'),
      ('ring-morgan-size-13', 14, v_id, 'Q'),
      ('ring-morgan-size-14', 15, v_id, 'R'),
      ('ring-morgan-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-morgan-specs',
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
    'ring-myrtle',
    'Myrtle',
    'Myrtle - Elongated Hexagon 6 Claw Trilogy with Tapered Baguette Side Stones Engagement Ring',
    'Myrtle is a modern take on the trilogy design, featuring a daring elongated hexagon cut centre stone framed by two tapered baguette side stones. A blend of clean, geometric lines from the step cuts with timeless symmetry, it brings a fresh, contemporary edge to a classic silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-myrtle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-myrtle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/myrtle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/myrtle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-myrtle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/myrtle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/myrtle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-myrtle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/myrtle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/myrtle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-myrtle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-myrtle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-myrtle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-myrtle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-myrtle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-myrtle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-myrtle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-myrtle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-myrtle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-myrtle-size-0', 1, v_id, 'D'),
      ('ring-myrtle-size-1', 2, v_id, 'E'),
      ('ring-myrtle-size-2', 3, v_id, 'F'),
      ('ring-myrtle-size-3', 4, v_id, 'G'),
      ('ring-myrtle-size-4', 5, v_id, 'H'),
      ('ring-myrtle-size-5', 6, v_id, 'I'),
      ('ring-myrtle-size-6', 7, v_id, 'J'),
      ('ring-myrtle-size-7', 8, v_id, 'K'),
      ('ring-myrtle-size-8', 9, v_id, 'L'),
      ('ring-myrtle-size-9', 10, v_id, 'M'),
      ('ring-myrtle-size-10', 11, v_id, 'N'),
      ('ring-myrtle-size-11', 12, v_id, 'O'),
      ('ring-myrtle-size-12', 13, v_id, 'P'),
      ('ring-myrtle-size-13', 14, v_id, 'Q'),
      ('ring-myrtle-size-14', 15, v_id, 'R'),
      ('ring-myrtle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-myrtle-specs',
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
    'ring-naomi',
    'Naomi',
    'Naomi - Round 6 Claw Solitaire with Crown Gallery and Pave Band Engagement Ring',
    'Naomi is a spectacular round solitaire featuring six eagle-tipped claws set low into a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-naomi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-naomi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/naomi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/naomi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-naomi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/naomi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/naomi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-naomi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/naomi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/naomi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-naomi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-naomi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-naomi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-naomi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-naomi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-naomi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-naomi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-naomi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-naomi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-naomi-size-0', 1, v_id, 'D'),
      ('ring-naomi-size-1', 2, v_id, 'E'),
      ('ring-naomi-size-2', 3, v_id, 'F'),
      ('ring-naomi-size-3', 4, v_id, 'G'),
      ('ring-naomi-size-4', 5, v_id, 'H'),
      ('ring-naomi-size-5', 6, v_id, 'I'),
      ('ring-naomi-size-6', 7, v_id, 'J'),
      ('ring-naomi-size-7', 8, v_id, 'K'),
      ('ring-naomi-size-8', 9, v_id, 'L'),
      ('ring-naomi-size-9', 10, v_id, 'M'),
      ('ring-naomi-size-10', 11, v_id, 'N'),
      ('ring-naomi-size-11', 12, v_id, 'O'),
      ('ring-naomi-size-12', 13, v_id, 'P'),
      ('ring-naomi-size-13', 14, v_id, 'Q'),
      ('ring-naomi-size-14', 15, v_id, 'R'),
      ('ring-naomi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-naomi-specs',
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
    'ring-nara',
    'Nara',
    'Nara - Emerald Claw Solitaire with Hidden Halo and Floating Cathedral Low Setting Engagement Ring',
    'Nara is a modern solitaire that balances beauty with practicality. A low-set emerald-cut centre stone is paired with an open bridge and hidden halo, creating a subtle floating effect and a low profile that pairs seamlessly with a flush-fit wedding band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nara';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nara-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nara/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nara-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nara/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nara/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nara-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nara/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nara/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nara-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nara-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nara-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nara-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nara-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nara-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nara-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nara-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nara-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nara-size-0', 1, v_id, 'D'),
      ('ring-nara-size-1', 2, v_id, 'E'),
      ('ring-nara-size-2', 3, v_id, 'F'),
      ('ring-nara-size-3', 4, v_id, 'G'),
      ('ring-nara-size-4', 5, v_id, 'H'),
      ('ring-nara-size-5', 6, v_id, 'I'),
      ('ring-nara-size-6', 7, v_id, 'J'),
      ('ring-nara-size-7', 8, v_id, 'K'),
      ('ring-nara-size-8', 9, v_id, 'L'),
      ('ring-nara-size-9', 10, v_id, 'M'),
      ('ring-nara-size-10', 11, v_id, 'N'),
      ('ring-nara-size-11', 12, v_id, 'O'),
      ('ring-nara-size-12', 13, v_id, 'P'),
      ('ring-nara-size-13', 14, v_id, 'Q'),
      ('ring-nara-size-14', 15, v_id, 'R'),
      ('ring-nara-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nara-specs',
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
    'ring-natalie',
    'Natalie',
    'Natalie - Princess 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Natalie is a timeless 4-claw solitaire design with a princess cut centre stone held atop an elegant cathedral setting and hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'princess'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-natalie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-natalie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/natalie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/natalie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-natalie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/natalie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/natalie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-natalie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/natalie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/natalie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-natalie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-natalie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-natalie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-natalie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-natalie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-natalie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-natalie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-natalie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-natalie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-natalie-size-0', 1, v_id, 'D'),
      ('ring-natalie-size-1', 2, v_id, 'E'),
      ('ring-natalie-size-2', 3, v_id, 'F'),
      ('ring-natalie-size-3', 4, v_id, 'G'),
      ('ring-natalie-size-4', 5, v_id, 'H'),
      ('ring-natalie-size-5', 6, v_id, 'I'),
      ('ring-natalie-size-6', 7, v_id, 'J'),
      ('ring-natalie-size-7', 8, v_id, 'K'),
      ('ring-natalie-size-8', 9, v_id, 'L'),
      ('ring-natalie-size-9', 10, v_id, 'M'),
      ('ring-natalie-size-10', 11, v_id, 'N'),
      ('ring-natalie-size-11', 12, v_id, 'O'),
      ('ring-natalie-size-12', 13, v_id, 'P'),
      ('ring-natalie-size-13', 14, v_id, 'Q'),
      ('ring-natalie-size-14', 15, v_id, 'R'),
      ('ring-natalie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-natalie-specs',
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
    'ring-nienna',
    'Nienna',
    'Nienna - Pear 5 Claw Solitaire with Hidden Halo Engagement Ring',
    'Nienna is a stunning 5-claw pear solitaire engagement ring set low into a polished band and completed by a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nienna';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nienna-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nienna/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nienna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nienna-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nienna/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nienna/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nienna-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nienna/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nienna/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nienna-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nienna-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nienna-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nienna-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nienna-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nienna-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nienna-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nienna-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nienna-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nienna-size-0', 1, v_id, 'D'),
      ('ring-nienna-size-1', 2, v_id, 'E'),
      ('ring-nienna-size-2', 3, v_id, 'F'),
      ('ring-nienna-size-3', 4, v_id, 'G'),
      ('ring-nienna-size-4', 5, v_id, 'H'),
      ('ring-nienna-size-5', 6, v_id, 'I'),
      ('ring-nienna-size-6', 7, v_id, 'J'),
      ('ring-nienna-size-7', 8, v_id, 'K'),
      ('ring-nienna-size-8', 9, v_id, 'L'),
      ('ring-nienna-size-9', 10, v_id, 'M'),
      ('ring-nienna-size-10', 11, v_id, 'N'),
      ('ring-nienna-size-11', 12, v_id, 'O'),
      ('ring-nienna-size-12', 13, v_id, 'P'),
      ('ring-nienna-size-13', 14, v_id, 'Q'),
      ('ring-nienna-size-14', 15, v_id, 'R'),
      ('ring-nienna-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nienna-specs',
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
    'ring-nina',
    'Nina',
    'Nina - Emerald 4 Claw Trilogy with Graduating Baguette Shoulder Stones Engagement Ring',
    'Nina is a breathtaking emerald trilogy engagement ring that plays on the art-deco or antique aesthetic with three gorgeous emerald cut stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nina-size-0', 1, v_id, 'D'),
      ('ring-nina-size-1', 2, v_id, 'E'),
      ('ring-nina-size-2', 3, v_id, 'F'),
      ('ring-nina-size-3', 4, v_id, 'G'),
      ('ring-nina-size-4', 5, v_id, 'H'),
      ('ring-nina-size-5', 6, v_id, 'I'),
      ('ring-nina-size-6', 7, v_id, 'J'),
      ('ring-nina-size-7', 8, v_id, 'K'),
      ('ring-nina-size-8', 9, v_id, 'L'),
      ('ring-nina-size-9', 10, v_id, 'M'),
      ('ring-nina-size-10', 11, v_id, 'N'),
      ('ring-nina-size-11', 12, v_id, 'O'),
      ('ring-nina-size-12', 13, v_id, 'P'),
      ('ring-nina-size-13', 14, v_id, 'Q'),
      ('ring-nina-size-14', 15, v_id, 'R'),
      ('ring-nina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nina-specs',
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
    'ring-noelle',
    'Noelle',
    'Noelle - Round 4 Claw Solitaire with Trellis Gallery and Cathedral Setting Engagement Ring',
    'The Noelle engagement ring features a beautiful 4-claw round solitaire atop a uniquely curved trellis cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-noelle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-noelle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noelle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-noelle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noelle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-noelle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noelle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noelle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noelle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-noelle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-noelle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-noelle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noelle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-noelle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noelle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-noelle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-noelle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-noelle-size-0', 1, v_id, 'D'),
      ('ring-noelle-size-1', 2, v_id, 'E'),
      ('ring-noelle-size-2', 3, v_id, 'F'),
      ('ring-noelle-size-3', 4, v_id, 'G'),
      ('ring-noelle-size-4', 5, v_id, 'H'),
      ('ring-noelle-size-5', 6, v_id, 'I'),
      ('ring-noelle-size-6', 7, v_id, 'J'),
      ('ring-noelle-size-7', 8, v_id, 'K'),
      ('ring-noelle-size-8', 9, v_id, 'L'),
      ('ring-noelle-size-9', 10, v_id, 'M'),
      ('ring-noelle-size-10', 11, v_id, 'N'),
      ('ring-noelle-size-11', 12, v_id, 'O'),
      ('ring-noelle-size-12', 13, v_id, 'P'),
      ('ring-noelle-size-13', 14, v_id, 'Q'),
      ('ring-noelle-size-14', 15, v_id, 'R'),
      ('ring-noelle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-noelle-specs',
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
    'ring-nola',
    'Nola',
    'Nola - Round 4 Claw Solitaire with Halo and Cathedral Setting Engagement Ring',
    'Nola is an exquisite 4-claw round halo design complete with sweeping with a cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nola';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nola-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nola/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nola/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nola-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nola/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nola/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nola-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nola/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nola/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nola-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nola-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nola-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nola-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nola-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nola-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nola-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nola-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nola-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nola-size-0', 1, v_id, 'D'),
      ('ring-nola-size-1', 2, v_id, 'E'),
      ('ring-nola-size-2', 3, v_id, 'F'),
      ('ring-nola-size-3', 4, v_id, 'G'),
      ('ring-nola-size-4', 5, v_id, 'H'),
      ('ring-nola-size-5', 6, v_id, 'I'),
      ('ring-nola-size-6', 7, v_id, 'J'),
      ('ring-nola-size-7', 8, v_id, 'K'),
      ('ring-nola-size-8', 9, v_id, 'L'),
      ('ring-nola-size-9', 10, v_id, 'M'),
      ('ring-nola-size-10', 11, v_id, 'N'),
      ('ring-nola-size-11', 12, v_id, 'O'),
      ('ring-nola-size-12', 13, v_id, 'P'),
      ('ring-nola-size-13', 14, v_id, 'Q'),
      ('ring-nola-size-14', 15, v_id, 'R'),
      ('ring-nola-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nola-specs',
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
    'ring-noor',
    'Noor',
    'Noor - Round and Pear Claw Toi et Moi with Wave Band Engagement Ring',
    'Sophisticated in its distinct design, the Noor engagement ring features a striking combination of a round and pear cut centre stone set within a uniquely curved band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-noor';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-noor-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noor/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-noor-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noor/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-noor-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/noor/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/noor/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noor-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-noor-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-noor-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-noor-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noor-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-noor-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-noor-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-noor-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-noor-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-noor-size-0', 1, v_id, 'D'),
      ('ring-noor-size-1', 2, v_id, 'E'),
      ('ring-noor-size-2', 3, v_id, 'F'),
      ('ring-noor-size-3', 4, v_id, 'G'),
      ('ring-noor-size-4', 5, v_id, 'H'),
      ('ring-noor-size-5', 6, v_id, 'I'),
      ('ring-noor-size-6', 7, v_id, 'J'),
      ('ring-noor-size-7', 8, v_id, 'K'),
      ('ring-noor-size-8', 9, v_id, 'L'),
      ('ring-noor-size-9', 10, v_id, 'M'),
      ('ring-noor-size-10', 11, v_id, 'N'),
      ('ring-noor-size-11', 12, v_id, 'O'),
      ('ring-noor-size-12', 13, v_id, 'P'),
      ('ring-noor-size-13', 14, v_id, 'Q'),
      ('ring-noor-size-14', 15, v_id, 'R'),
      ('ring-noor-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-noor-specs',
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
    'ring-nora',
    'Nora',
    'Nora - Emerald Claw Solitaire with Spiral Gallery and Cathedral Low Setting Engagement Ring',
    'The beautiful Nora engagement ring showcases an elegant emerald cut centre stone atop a uniquely twisted 4-claw cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'low_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-nora';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-nora-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nora-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-nora-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/nora/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/nora/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-nora-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-nora-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-nora-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-nora-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-nora-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-nora-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-nora-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-nora-size-0', 1, v_id, 'D'),
      ('ring-nora-size-1', 2, v_id, 'E'),
      ('ring-nora-size-2', 3, v_id, 'F'),
      ('ring-nora-size-3', 4, v_id, 'G'),
      ('ring-nora-size-4', 5, v_id, 'H'),
      ('ring-nora-size-5', 6, v_id, 'I'),
      ('ring-nora-size-6', 7, v_id, 'J'),
      ('ring-nora-size-7', 8, v_id, 'K'),
      ('ring-nora-size-8', 9, v_id, 'L'),
      ('ring-nora-size-9', 10, v_id, 'M'),
      ('ring-nora-size-10', 11, v_id, 'N'),
      ('ring-nora-size-11', 12, v_id, 'O'),
      ('ring-nora-size-12', 13, v_id, 'P'),
      ('ring-nora-size-13', 14, v_id, 'Q'),
      ('ring-nora-size-14', 15, v_id, 'R'),
      ('ring-nora-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-nora-specs',
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
    'ring-octavia',
    'Octavia',
    'Octavia - Round 4 Claw Trilogy with Round Side Stones and Trellis Gallery Engagement Ring',
    'Octavia is a timeless trilogy design featuring round cut stones and a beautiful woven trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-octavia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-octavia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-octavia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-octavia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/octavia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/octavia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-octavia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-octavia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-octavia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-octavia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-octavia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-octavia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-octavia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-octavia-size-0', 1, v_id, 'D'),
      ('ring-octavia-size-1', 2, v_id, 'E'),
      ('ring-octavia-size-2', 3, v_id, 'F'),
      ('ring-octavia-size-3', 4, v_id, 'G'),
      ('ring-octavia-size-4', 5, v_id, 'H'),
      ('ring-octavia-size-5', 6, v_id, 'I'),
      ('ring-octavia-size-6', 7, v_id, 'J'),
      ('ring-octavia-size-7', 8, v_id, 'K'),
      ('ring-octavia-size-8', 9, v_id, 'L'),
      ('ring-octavia-size-9', 10, v_id, 'M'),
      ('ring-octavia-size-10', 11, v_id, 'N'),
      ('ring-octavia-size-11', 12, v_id, 'O'),
      ('ring-octavia-size-12', 13, v_id, 'P'),
      ('ring-octavia-size-13', 14, v_id, 'Q'),
      ('ring-octavia-size-14', 15, v_id, 'R'),
      ('ring-octavia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-octavia-specs',
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
    'ring-olive',
    'Olive',
    'Olive - Statement Emerald Bezel Solitaire with East West Setting and Open Cathedral High Setting Engagement Ring',
    'Olive is a beautifully refined design featuring an east-west emerald cut centre stone on a cathedral bezel setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-olive';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-olive-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olive-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olive-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olive/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olive/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-olive-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-olive-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-olive-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-olive-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olive-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-olive-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-olive-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-olive-size-0', 1, v_id, 'D'),
      ('ring-olive-size-1', 2, v_id, 'E'),
      ('ring-olive-size-2', 3, v_id, 'F'),
      ('ring-olive-size-3', 4, v_id, 'G'),
      ('ring-olive-size-4', 5, v_id, 'H'),
      ('ring-olive-size-5', 6, v_id, 'I'),
      ('ring-olive-size-6', 7, v_id, 'J'),
      ('ring-olive-size-7', 8, v_id, 'K'),
      ('ring-olive-size-8', 9, v_id, 'L'),
      ('ring-olive-size-9', 10, v_id, 'M'),
      ('ring-olive-size-10', 11, v_id, 'N'),
      ('ring-olive-size-11', 12, v_id, 'O'),
      ('ring-olive-size-12', 13, v_id, 'P'),
      ('ring-olive-size-13', 14, v_id, 'Q'),
      ('ring-olive-size-14', 15, v_id, 'R'),
      ('ring-olive-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-olive-specs',
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
    'ring-olivia',
    'Olivia',
    'Olivia - Oval 4 Claw Solitaire with Cathedral Setting and Open Trellis Gallery Engagement Ring',
    'The beautiful Olivia engagement ring is a classic 4-claw oval solitaire design with a sweeping trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-olivia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-olivia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olivia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-olivia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/olivia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/olivia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-olivia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-olivia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-olivia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-olivia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-olivia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-olivia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-olivia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-olivia-size-0', 1, v_id, 'D'),
      ('ring-olivia-size-1', 2, v_id, 'E'),
      ('ring-olivia-size-2', 3, v_id, 'F'),
      ('ring-olivia-size-3', 4, v_id, 'G'),
      ('ring-olivia-size-4', 5, v_id, 'H'),
      ('ring-olivia-size-5', 6, v_id, 'I'),
      ('ring-olivia-size-6', 7, v_id, 'J'),
      ('ring-olivia-size-7', 8, v_id, 'K'),
      ('ring-olivia-size-8', 9, v_id, 'L'),
      ('ring-olivia-size-9', 10, v_id, 'M'),
      ('ring-olivia-size-10', 11, v_id, 'N'),
      ('ring-olivia-size-11', 12, v_id, 'O'),
      ('ring-olivia-size-12', 13, v_id, 'P'),
      ('ring-olivia-size-13', 14, v_id, 'Q'),
      ('ring-olivia-size-14', 15, v_id, 'R'),
      ('ring-olivia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-olivia-specs',
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
    'ring-paige',
    'Paige',
    'Paige - Oval 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Paige is an exquisite oval solitaire engagement ring with four eagle-tipped claws, a sparkling hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-paige';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-paige-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-paige-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-paige-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/paige/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/paige/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-paige-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-paige-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-paige-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-paige-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-paige-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-paige-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-paige-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-paige-size-0', 1, v_id, 'D'),
      ('ring-paige-size-1', 2, v_id, 'E'),
      ('ring-paige-size-2', 3, v_id, 'F'),
      ('ring-paige-size-3', 4, v_id, 'G'),
      ('ring-paige-size-4', 5, v_id, 'H'),
      ('ring-paige-size-5', 6, v_id, 'I'),
      ('ring-paige-size-6', 7, v_id, 'J'),
      ('ring-paige-size-7', 8, v_id, 'K'),
      ('ring-paige-size-8', 9, v_id, 'L'),
      ('ring-paige-size-9', 10, v_id, 'M'),
      ('ring-paige-size-10', 11, v_id, 'N'),
      ('ring-paige-size-11', 12, v_id, 'O'),
      ('ring-paige-size-12', 13, v_id, 'P'),
      ('ring-paige-size-13', 14, v_id, 'Q'),
      ('ring-paige-size-14', 15, v_id, 'R'),
      ('ring-paige-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-paige-specs',
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
    'ring-parker',
    'Parker',
    'Parker - Emerald 4 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'Parker is a charming emerald solitaire design with four eagle-tipped claws and a unique band characterised by round and marquise cut accent stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-parker';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-parker-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-parker-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-parker-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-parker-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-parker-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-parker-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-parker-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-parker-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-parker-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-parker-size-0', 1, v_id, 'D'),
      ('ring-parker-size-1', 2, v_id, 'E'),
      ('ring-parker-size-2', 3, v_id, 'F'),
      ('ring-parker-size-3', 4, v_id, 'G'),
      ('ring-parker-size-4', 5, v_id, 'H'),
      ('ring-parker-size-5', 6, v_id, 'I'),
      ('ring-parker-size-6', 7, v_id, 'J'),
      ('ring-parker-size-7', 8, v_id, 'K'),
      ('ring-parker-size-8', 9, v_id, 'L'),
      ('ring-parker-size-9', 10, v_id, 'M'),
      ('ring-parker-size-10', 11, v_id, 'N'),
      ('ring-parker-size-11', 12, v_id, 'O'),
      ('ring-parker-size-12', 13, v_id, 'P'),
      ('ring-parker-size-13', 14, v_id, 'Q'),
      ('ring-parker-size-14', 15, v_id, 'R'),
      ('ring-parker-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-parker-specs',
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
    'ring-penelope',
    'Penelope',
    'Penelope - Oval Claw Solitaire with Hidden Halo and Triple Pave Band Engagement Ring',
    'Penelope is a stunning oval solitaire engagement ring with four eagle-tipped claws, a sparkling hidden halo and 2/3 triple pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-penelope';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-penelope-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-penelope-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-penelope-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-penelope-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-penelope-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-penelope-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-penelope-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-penelope-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-penelope-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-penelope-size-0', 1, v_id, 'D'),
      ('ring-penelope-size-1', 2, v_id, 'E'),
      ('ring-penelope-size-2', 3, v_id, 'F'),
      ('ring-penelope-size-3', 4, v_id, 'G'),
      ('ring-penelope-size-4', 5, v_id, 'H'),
      ('ring-penelope-size-5', 6, v_id, 'I'),
      ('ring-penelope-size-6', 7, v_id, 'J'),
      ('ring-penelope-size-7', 8, v_id, 'K'),
      ('ring-penelope-size-8', 9, v_id, 'L'),
      ('ring-penelope-size-9', 10, v_id, 'M'),
      ('ring-penelope-size-10', 11, v_id, 'N'),
      ('ring-penelope-size-11', 12, v_id, 'O'),
      ('ring-penelope-size-12', 13, v_id, 'P'),
      ('ring-penelope-size-13', 14, v_id, 'Q'),
      ('ring-penelope-size-14', 15, v_id, 'R'),
      ('ring-penelope-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-penelope-specs',
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
    'ring-phoebe',
    'Phoebe',
    'Phoebe - Oval 4 Claw Solitaire with Halo Engagement Ring',
    'The Phoebe engagement ring features a striking oval cut centre stone framed by an exquisite halo and four eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-phoebe';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-phoebe-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-phoebe-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-phoebe-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-phoebe-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-phoebe-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-phoebe-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-phoebe-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-phoebe-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-phoebe-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-phoebe-size-0', 1, v_id, 'D'),
      ('ring-phoebe-size-1', 2, v_id, 'E'),
      ('ring-phoebe-size-2', 3, v_id, 'F'),
      ('ring-phoebe-size-3', 4, v_id, 'G'),
      ('ring-phoebe-size-4', 5, v_id, 'H'),
      ('ring-phoebe-size-5', 6, v_id, 'I'),
      ('ring-phoebe-size-6', 7, v_id, 'J'),
      ('ring-phoebe-size-7', 8, v_id, 'K'),
      ('ring-phoebe-size-8', 9, v_id, 'L'),
      ('ring-phoebe-size-9', 10, v_id, 'M'),
      ('ring-phoebe-size-10', 11, v_id, 'N'),
      ('ring-phoebe-size-11', 12, v_id, 'O'),
      ('ring-phoebe-size-12', 13, v_id, 'P'),
      ('ring-phoebe-size-13', 14, v_id, 'Q'),
      ('ring-phoebe-size-14', 15, v_id, 'R'),
      ('ring-phoebe-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-phoebe-specs',
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
    'ring-pia',
    'Pia',
    'Pia - Marquise 2 Claw Solitaire with Wave Band and East West Setting Engagement Ring',
    'Pia showcases a marquise cut centre stone resting within two v-claws and a uniquely curved band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-pia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-pia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-pia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-pia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-pia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-pia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-pia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-pia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-pia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-pia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-pia-size-0', 1, v_id, 'D'),
      ('ring-pia-size-1', 2, v_id, 'E'),
      ('ring-pia-size-2', 3, v_id, 'F'),
      ('ring-pia-size-3', 4, v_id, 'G'),
      ('ring-pia-size-4', 5, v_id, 'H'),
      ('ring-pia-size-5', 6, v_id, 'I'),
      ('ring-pia-size-6', 7, v_id, 'J'),
      ('ring-pia-size-7', 8, v_id, 'K'),
      ('ring-pia-size-8', 9, v_id, 'L'),
      ('ring-pia-size-9', 10, v_id, 'M'),
      ('ring-pia-size-10', 11, v_id, 'N'),
      ('ring-pia-size-11', 12, v_id, 'O'),
      ('ring-pia-size-12', 13, v_id, 'P'),
      ('ring-pia-size-13', 14, v_id, 'Q'),
      ('ring-pia-size-14', 15, v_id, 'R'),
      ('ring-pia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-pia-specs',
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
    'ring-polly',
    'Polly',
    'Polly - Pear 5 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Polly features a basket-set pear-shaped centre stone, accented by a delicate cluster of brilliant round stones. The design balances soft detail with a clean, refined silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-polly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-polly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-polly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-polly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-polly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-polly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-polly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-polly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-polly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-polly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-polly-size-0', 1, v_id, 'D'),
      ('ring-polly-size-1', 2, v_id, 'E'),
      ('ring-polly-size-2', 3, v_id, 'F'),
      ('ring-polly-size-3', 4, v_id, 'G'),
      ('ring-polly-size-4', 5, v_id, 'H'),
      ('ring-polly-size-5', 6, v_id, 'I'),
      ('ring-polly-size-6', 7, v_id, 'J'),
      ('ring-polly-size-7', 8, v_id, 'K'),
      ('ring-polly-size-8', 9, v_id, 'L'),
      ('ring-polly-size-9', 10, v_id, 'M'),
      ('ring-polly-size-10', 11, v_id, 'N'),
      ('ring-polly-size-11', 12, v_id, 'O'),
      ('ring-polly-size-12', 13, v_id, 'P'),
      ('ring-polly-size-13', 14, v_id, 'Q'),
      ('ring-polly-size-14', 15, v_id, 'R'),
      ('ring-polly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-polly-specs',
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

