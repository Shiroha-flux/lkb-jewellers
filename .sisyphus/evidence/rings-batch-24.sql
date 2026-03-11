DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-jane',
    'Jane',
    'Jane - Emerald 4 Claw Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Jane is a sophisticated 4-claw emerald solitaire engagement ring with the added beauty of a hidden halo and cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jane';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jane-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jane-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jane-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jane/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jane/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jane-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jane-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jane-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jane-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jane-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jane-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jane-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jane-size-0', 1, v_id, 'D'),
      ('ring-jane-size-1', 2, v_id, 'E'),
      ('ring-jane-size-2', 3, v_id, 'F'),
      ('ring-jane-size-3', 4, v_id, 'G'),
      ('ring-jane-size-4', 5, v_id, 'H'),
      ('ring-jane-size-5', 6, v_id, 'I'),
      ('ring-jane-size-6', 7, v_id, 'J'),
      ('ring-jane-size-7', 8, v_id, 'K'),
      ('ring-jane-size-8', 9, v_id, 'L'),
      ('ring-jane-size-9', 10, v_id, 'M'),
      ('ring-jane-size-10', 11, v_id, 'N'),
      ('ring-jane-size-11', 12, v_id, 'O'),
      ('ring-jane-size-12', 13, v_id, 'P'),
      ('ring-jane-size-13', 14, v_id, 'Q'),
      ('ring-jane-size-14', 15, v_id, 'R'),
      ('ring-jane-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jane-specs',
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
    'ring-jayden',
    'Jayden',
    'Jayden - Round Claw Solitaire with Petal Gallery and Cigar Band Engagement Ring',
    'Clasped by six eagle-tipped claws in a petal design, the Jayden engagement ring displays a stunning round cut centre stone set low within a thick cigar band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jayden';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jayden-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jayden-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jayden-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jayden/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jayden/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jayden-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jayden-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jayden-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jayden-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jayden-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jayden-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jayden-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jayden-size-0', 1, v_id, 'D'),
      ('ring-jayden-size-1', 2, v_id, 'E'),
      ('ring-jayden-size-2', 3, v_id, 'F'),
      ('ring-jayden-size-3', 4, v_id, 'G'),
      ('ring-jayden-size-4', 5, v_id, 'H'),
      ('ring-jayden-size-5', 6, v_id, 'I'),
      ('ring-jayden-size-6', 7, v_id, 'J'),
      ('ring-jayden-size-7', 8, v_id, 'K'),
      ('ring-jayden-size-8', 9, v_id, 'L'),
      ('ring-jayden-size-9', 10, v_id, 'M'),
      ('ring-jayden-size-10', 11, v_id, 'N'),
      ('ring-jayden-size-11', 12, v_id, 'O'),
      ('ring-jayden-size-12', 13, v_id, 'P'),
      ('ring-jayden-size-13', 14, v_id, 'Q'),
      ('ring-jayden-size-14', 15, v_id, 'R'),
      ('ring-jayden-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jayden-specs',
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
    'ring-jaylene',
    'Jaylene',
    'Jaylene - Round 4 Claw Trilogy with Round Side Stones, Twisted Pave Band and Trellis Gallery Engagement Ring',
    'Jaylene is an exquisite round stone trilogy with an intricate twisted pavé band and woven trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jaylene';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jaylene-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jaylene-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jaylene-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jaylene/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jaylene/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jaylene-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jaylene-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jaylene-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jaylene-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jaylene-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jaylene-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jaylene-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jaylene-size-0', 1, v_id, 'D'),
      ('ring-jaylene-size-1', 2, v_id, 'E'),
      ('ring-jaylene-size-2', 3, v_id, 'F'),
      ('ring-jaylene-size-3', 4, v_id, 'G'),
      ('ring-jaylene-size-4', 5, v_id, 'H'),
      ('ring-jaylene-size-5', 6, v_id, 'I'),
      ('ring-jaylene-size-6', 7, v_id, 'J'),
      ('ring-jaylene-size-7', 8, v_id, 'K'),
      ('ring-jaylene-size-8', 9, v_id, 'L'),
      ('ring-jaylene-size-9', 10, v_id, 'M'),
      ('ring-jaylene-size-10', 11, v_id, 'N'),
      ('ring-jaylene-size-11', 12, v_id, 'O'),
      ('ring-jaylene-size-12', 13, v_id, 'P'),
      ('ring-jaylene-size-13', 14, v_id, 'Q'),
      ('ring-jaylene-size-14', 15, v_id, 'R'),
      ('ring-jaylene-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jaylene-specs',
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
    'ring-jennifer',
    'Jennifer',
    'Jennifer - Pear 5 Claw Solitaire with Bypass Band Engagement Ring',
    'Jennifer centres a pear-shaped stone in a refined five-claw setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-jennifer';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-jennifer-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jennifer-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-jennifer-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/jennifer/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/jennifer/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-jennifer-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-jennifer-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-jennifer-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-jennifer-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-jennifer-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-jennifer-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-jennifer-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-jennifer-size-0', 1, v_id, 'D'),
      ('ring-jennifer-size-1', 2, v_id, 'E'),
      ('ring-jennifer-size-2', 3, v_id, 'F'),
      ('ring-jennifer-size-3', 4, v_id, 'G'),
      ('ring-jennifer-size-4', 5, v_id, 'H'),
      ('ring-jennifer-size-5', 6, v_id, 'I'),
      ('ring-jennifer-size-6', 7, v_id, 'J'),
      ('ring-jennifer-size-7', 8, v_id, 'K'),
      ('ring-jennifer-size-8', 9, v_id, 'L'),
      ('ring-jennifer-size-9', 10, v_id, 'M'),
      ('ring-jennifer-size-10', 11, v_id, 'N'),
      ('ring-jennifer-size-11', 12, v_id, 'O'),
      ('ring-jennifer-size-12', 13, v_id, 'P'),
      ('ring-jennifer-size-13', 14, v_id, 'Q'),
      ('ring-jennifer-size-14', 15, v_id, 'R'),
      ('ring-jennifer-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-jennifer-specs',
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
    'ring-josephine',
    'Josephine',
    'Josephine - Radiant 4 Claw Solitaire with Round Accent Stones and Wrap Around Hidden Halo Engagement Ring',
    'The 4-claw radiant solitaire design is elevated in the Josephine ring with a unique round cut side stone band and sparkling wrap-around hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-josephine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-josephine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-josephine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-josephine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/josephine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/josephine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-josephine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-josephine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-josephine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-josephine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-josephine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-josephine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-josephine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-josephine-size-0', 1, v_id, 'D'),
      ('ring-josephine-size-1', 2, v_id, 'E'),
      ('ring-josephine-size-2', 3, v_id, 'F'),
      ('ring-josephine-size-3', 4, v_id, 'G'),
      ('ring-josephine-size-4', 5, v_id, 'H'),
      ('ring-josephine-size-5', 6, v_id, 'I'),
      ('ring-josephine-size-6', 7, v_id, 'J'),
      ('ring-josephine-size-7', 8, v_id, 'K'),
      ('ring-josephine-size-8', 9, v_id, 'L'),
      ('ring-josephine-size-9', 10, v_id, 'M'),
      ('ring-josephine-size-10', 11, v_id, 'N'),
      ('ring-josephine-size-11', 12, v_id, 'O'),
      ('ring-josephine-size-12', 13, v_id, 'P'),
      ('ring-josephine-size-13', 14, v_id, 'Q'),
      ('ring-josephine-size-14', 15, v_id, 'R'),
      ('ring-josephine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-josephine-specs',
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