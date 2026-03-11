DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-sadie',
    'Sadie',
    'Sadie - Elongated Cushion Claw Solitaire with Pear Accents and Round Shoulder Stones Engagement Ring',
    'Sadie is a graceful 4-claw elongated cushion trilogy design featuring a beautiful elongated cushion cut centre stone encapsulated in a tulip motif basket. The elongated shape of the marquise is perfectly complimented by its shouldered pear and round cut side stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sadie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sadie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sadie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sadie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sadie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sadie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sadie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sadie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sadie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sadie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sadie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sadie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sadie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sadie-size-0', 1, v_id, 'D'),
      ('ring-sadie-size-1', 2, v_id, 'E'),
      ('ring-sadie-size-2', 3, v_id, 'F'),
      ('ring-sadie-size-3', 4, v_id, 'G'),
      ('ring-sadie-size-4', 5, v_id, 'H'),
      ('ring-sadie-size-5', 6, v_id, 'I'),
      ('ring-sadie-size-6', 7, v_id, 'J'),
      ('ring-sadie-size-7', 8, v_id, 'K'),
      ('ring-sadie-size-8', 9, v_id, 'L'),
      ('ring-sadie-size-9', 10, v_id, 'M'),
      ('ring-sadie-size-10', 11, v_id, 'N'),
      ('ring-sadie-size-11', 12, v_id, 'O'),
      ('ring-sadie-size-12', 13, v_id, 'P'),
      ('ring-sadie-size-13', 14, v_id, 'Q'),
      ('ring-sadie-size-14', 15, v_id, 'R'),
      ('ring-sadie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sadie-specs',
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
    'ring-sage',
    'Sage',
    'Sage - Oval Bezel Solitaire Engagement Ring',
    'Sage is a stunning bezel-set oval solitaire paired with a minimal band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sage';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sage-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sage-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sage-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sage/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sage/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sage-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sage-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sage-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sage-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sage-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sage-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sage-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sage-size-0', 1, v_id, 'D'),
      ('ring-sage-size-1', 2, v_id, 'E'),
      ('ring-sage-size-2', 3, v_id, 'F'),
      ('ring-sage-size-3', 4, v_id, 'G'),
      ('ring-sage-size-4', 5, v_id, 'H'),
      ('ring-sage-size-5', 6, v_id, 'I'),
      ('ring-sage-size-6', 7, v_id, 'J'),
      ('ring-sage-size-7', 8, v_id, 'K'),
      ('ring-sage-size-8', 9, v_id, 'L'),
      ('ring-sage-size-9', 10, v_id, 'M'),
      ('ring-sage-size-10', 11, v_id, 'N'),
      ('ring-sage-size-11', 12, v_id, 'O'),
      ('ring-sage-size-12', 13, v_id, 'P'),
      ('ring-sage-size-13', 14, v_id, 'Q'),
      ('ring-sage-size-14', 15, v_id, 'R'),
      ('ring-sage-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sage-specs',
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
    'ring-salma',
    'Salma',
    'Salma - Marquise and Pear Claw Toi et Moi with Open Band Engagement Ring',
    'Salma''s distinct pear and marquise duo is elevated with a beautiful open band in this iconic toi et moi engagement ring. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-salma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-salma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-salma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-salma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/salma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/salma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-salma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-salma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-salma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-salma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-salma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-salma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-salma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-salma-size-0', 1, v_id, 'D'),
      ('ring-salma-size-1', 2, v_id, 'E'),
      ('ring-salma-size-2', 3, v_id, 'F'),
      ('ring-salma-size-3', 4, v_id, 'G'),
      ('ring-salma-size-4', 5, v_id, 'H'),
      ('ring-salma-size-5', 6, v_id, 'I'),
      ('ring-salma-size-6', 7, v_id, 'J'),
      ('ring-salma-size-7', 8, v_id, 'K'),
      ('ring-salma-size-8', 9, v_id, 'L'),
      ('ring-salma-size-9', 10, v_id, 'M'),
      ('ring-salma-size-10', 11, v_id, 'N'),
      ('ring-salma-size-11', 12, v_id, 'O'),
      ('ring-salma-size-12', 13, v_id, 'P'),
      ('ring-salma-size-13', 14, v_id, 'Q'),
      ('ring-salma-size-14', 15, v_id, 'R'),
      ('ring-salma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-salma-specs',
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
    'ring-sasha',
    'Sasha',
    'Sasha - Oval 8 Double Claw Solitaire with Hidden Halo, Pave Band and Cathedral Setting Engagement Ring',
    'The Sasha engagement ring is a striking oval solitaire featuring four double-tipped claws, a hidden halo and 2/3 pavé cathedral band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-sasha';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-sasha-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sasha-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-sasha-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/sasha/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/sasha/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-sasha-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-sasha-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-sasha-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-sasha-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-sasha-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-sasha-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-sasha-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-sasha-size-0', 1, v_id, 'D'),
      ('ring-sasha-size-1', 2, v_id, 'E'),
      ('ring-sasha-size-2', 3, v_id, 'F'),
      ('ring-sasha-size-3', 4, v_id, 'G'),
      ('ring-sasha-size-4', 5, v_id, 'H'),
      ('ring-sasha-size-5', 6, v_id, 'I'),
      ('ring-sasha-size-6', 7, v_id, 'J'),
      ('ring-sasha-size-7', 8, v_id, 'K'),
      ('ring-sasha-size-8', 9, v_id, 'L'),
      ('ring-sasha-size-9', 10, v_id, 'M'),
      ('ring-sasha-size-10', 11, v_id, 'N'),
      ('ring-sasha-size-11', 12, v_id, 'O'),
      ('ring-sasha-size-12', 13, v_id, 'P'),
      ('ring-sasha-size-13', 14, v_id, 'Q'),
      ('ring-sasha-size-14', 15, v_id, 'R'),
      ('ring-sasha-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-sasha-specs',
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
    'ring-savannah',
    'Savannah',
    'Savannah - Oval 4 Claw Solitaire with Double Sunburst Halo and Cathedral Setting Engagement Ring',
    'Savannah is a spectacular engagement ring featuring an oval cut centre stone framed by a charming halo, intricately set with an array of round cut accent stones and complete with a sweeping cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-savannah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-savannah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-savannah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-savannah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/savannah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/savannah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-savannah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-savannah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-savannah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-savannah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-savannah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-savannah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-savannah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-savannah-size-0', 1, v_id, 'D'),
      ('ring-savannah-size-1', 2, v_id, 'E'),
      ('ring-savannah-size-2', 3, v_id, 'F'),
      ('ring-savannah-size-3', 4, v_id, 'G'),
      ('ring-savannah-size-4', 5, v_id, 'H'),
      ('ring-savannah-size-5', 6, v_id, 'I'),
      ('ring-savannah-size-6', 7, v_id, 'J'),
      ('ring-savannah-size-7', 8, v_id, 'K'),
      ('ring-savannah-size-8', 9, v_id, 'L'),
      ('ring-savannah-size-9', 10, v_id, 'M'),
      ('ring-savannah-size-10', 11, v_id, 'N'),
      ('ring-savannah-size-11', 12, v_id, 'O'),
      ('ring-savannah-size-12', 13, v_id, 'P'),
      ('ring-savannah-size-13', 14, v_id, 'Q'),
      ('ring-savannah-size-14', 15, v_id, 'R'),
      ('ring-savannah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-savannah-specs',
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