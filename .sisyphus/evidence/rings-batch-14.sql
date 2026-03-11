DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-dahlia',
    'Dahlia',
    'Dahlia - Round Claw Solitaire with Petal Gallery and Accented Tiara Detail Engagement Ring',
    'Dahlia centres a round stone in a refined four-claw setting, framed by a sculpted petal gallery. A discreet tiara-style hidden halo sits beneath, adding quiet detail and soft, modern structure. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-dahlia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-dahlia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dahlia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-dahlia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dahlia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-dahlia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dahlia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dahlia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dahlia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-dahlia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-dahlia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-dahlia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dahlia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-dahlia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dahlia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-dahlia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-dahlia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-dahlia-size-0', 1, v_id, 'D'),
      ('ring-dahlia-size-1', 2, v_id, 'E'),
      ('ring-dahlia-size-2', 3, v_id, 'F'),
      ('ring-dahlia-size-3', 4, v_id, 'G'),
      ('ring-dahlia-size-4', 5, v_id, 'H'),
      ('ring-dahlia-size-5', 6, v_id, 'I'),
      ('ring-dahlia-size-6', 7, v_id, 'J'),
      ('ring-dahlia-size-7', 8, v_id, 'K'),
      ('ring-dahlia-size-8', 9, v_id, 'L'),
      ('ring-dahlia-size-9', 10, v_id, 'M'),
      ('ring-dahlia-size-10', 11, v_id, 'N'),
      ('ring-dahlia-size-11', 12, v_id, 'O'),
      ('ring-dahlia-size-12', 13, v_id, 'P'),
      ('ring-dahlia-size-13', 14, v_id, 'Q'),
      ('ring-dahlia-size-14', 15, v_id, 'R'),
      ('ring-dahlia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-dahlia-specs',
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
    'ring-dakota',
    'Dakota',
    'Dakota - Radiant 4 Claw Solitaire with Cathedral Setting and Open Trellis Gallery Engagement Ring',
    'Dakota is an elegant radiant solitaire boasting a sweeping 4-claw trellis setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-dakota';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-dakota-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dakota/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dakota/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-dakota-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dakota/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dakota/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-dakota-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/dakota/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/dakota/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dakota-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-dakota-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-dakota-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-dakota-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dakota-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-dakota-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-dakota-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-dakota-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-dakota-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-dakota-size-0', 1, v_id, 'D'),
      ('ring-dakota-size-1', 2, v_id, 'E'),
      ('ring-dakota-size-2', 3, v_id, 'F'),
      ('ring-dakota-size-3', 4, v_id, 'G'),
      ('ring-dakota-size-4', 5, v_id, 'H'),
      ('ring-dakota-size-5', 6, v_id, 'I'),
      ('ring-dakota-size-6', 7, v_id, 'J'),
      ('ring-dakota-size-7', 8, v_id, 'K'),
      ('ring-dakota-size-8', 9, v_id, 'L'),
      ('ring-dakota-size-9', 10, v_id, 'M'),
      ('ring-dakota-size-10', 11, v_id, 'N'),
      ('ring-dakota-size-11', 12, v_id, 'O'),
      ('ring-dakota-size-12', 13, v_id, 'P'),
      ('ring-dakota-size-13', 14, v_id, 'Q'),
      ('ring-dakota-size-14', 15, v_id, 'R'),
      ('ring-dakota-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-dakota-specs',
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
    'ring-daisy',
    'Daisy',
    'Daisy - Classic Oval 4 Claw Solitaire Engagement Ring',
    'Striking in its minimal design, the Daisy engagement ring features a stunning oval cut centre stone seated within four eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-daisy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-daisy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daisy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daisy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daisy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daisy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daisy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daisy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daisy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daisy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-daisy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-daisy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-daisy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daisy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-daisy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daisy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-daisy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-daisy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-daisy-size-0', 1, v_id, 'D'),
      ('ring-daisy-size-1', 2, v_id, 'E'),
      ('ring-daisy-size-2', 3, v_id, 'F'),
      ('ring-daisy-size-3', 4, v_id, 'G'),
      ('ring-daisy-size-4', 5, v_id, 'H'),
      ('ring-daisy-size-5', 6, v_id, 'I'),
      ('ring-daisy-size-6', 7, v_id, 'J'),
      ('ring-daisy-size-7', 8, v_id, 'K'),
      ('ring-daisy-size-8', 9, v_id, 'L'),
      ('ring-daisy-size-9', 10, v_id, 'M'),
      ('ring-daisy-size-10', 11, v_id, 'N'),
      ('ring-daisy-size-11', 12, v_id, 'O'),
      ('ring-daisy-size-12', 13, v_id, 'P'),
      ('ring-daisy-size-13', 14, v_id, 'Q'),
      ('ring-daisy-size-14', 15, v_id, 'R'),
      ('ring-daisy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-daisy-specs',
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
    'ring-daya',
    'Daya',
    'Daya - Elongated Cushion 4 Claw Solitaire with Bezel Frame and East West Setting Engagement Ring',
    'Designed to be worn low set, the Daya is an east west elongated cushion cut solitaire that blends vintage character with sculptural modern design for an effortlessly elevated silhouette that features a subtle under bezel frame and our signature eagle claws, offering the perfect balance for those torn between a bezel and a claw setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-daya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-daya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-daya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-daya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-daya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-daya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-daya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-daya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-daya-size-0', 1, v_id, 'D'),
      ('ring-daya-size-1', 2, v_id, 'E'),
      ('ring-daya-size-2', 3, v_id, 'F'),
      ('ring-daya-size-3', 4, v_id, 'G'),
      ('ring-daya-size-4', 5, v_id, 'H'),
      ('ring-daya-size-5', 6, v_id, 'I'),
      ('ring-daya-size-6', 7, v_id, 'J'),
      ('ring-daya-size-7', 8, v_id, 'K'),
      ('ring-daya-size-8', 9, v_id, 'L'),
      ('ring-daya-size-9', 10, v_id, 'M'),
      ('ring-daya-size-10', 11, v_id, 'N'),
      ('ring-daya-size-11', 12, v_id, 'O'),
      ('ring-daya-size-12', 13, v_id, 'P'),
      ('ring-daya-size-13', 14, v_id, 'Q'),
      ('ring-daya-size-14', 15, v_id, 'R'),
      ('ring-daya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-daya-specs',
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
    'ring-daphne',
    'Daphne',
    'Daphne - Oval Bezel Solitaire with Cathedral Setting Engagement Ring',
    'Daphne is a beautiful oval bezel design held within a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-daphne';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-daphne-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daphne/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daphne/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daphne-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daphne/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daphne/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daphne-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daphne/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daphne/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daphne-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-daphne-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-daphne-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-daphne-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daphne-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-daphne-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daphne-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-daphne-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-daphne-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-daphne-size-0', 1, v_id, 'D'),
      ('ring-daphne-size-1', 2, v_id, 'E'),
      ('ring-daphne-size-2', 3, v_id, 'F'),
      ('ring-daphne-size-3', 4, v_id, 'G'),
      ('ring-daphne-size-4', 5, v_id, 'H'),
      ('ring-daphne-size-5', 6, v_id, 'I'),
      ('ring-daphne-size-6', 7, v_id, 'J'),
      ('ring-daphne-size-7', 8, v_id, 'K'),
      ('ring-daphne-size-8', 9, v_id, 'L'),
      ('ring-daphne-size-9', 10, v_id, 'M'),
      ('ring-daphne-size-10', 11, v_id, 'N'),
      ('ring-daphne-size-11', 12, v_id, 'O'),
      ('ring-daphne-size-12', 13, v_id, 'P'),
      ('ring-daphne-size-13', 14, v_id, 'Q'),
      ('ring-daphne-size-14', 15, v_id, 'R'),
      ('ring-daphne-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-daphne-specs',
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