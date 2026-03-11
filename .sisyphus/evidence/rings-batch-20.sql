DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-gemma',
    'Gemma',
    'Gemma - Oval Bezel Solitaire with Twisted Gallery Engagement Ring',
    'The Gemma engagement ring adds a distinct flourish to the classic oval solitaire with a bezel-set oval cut centre stone and unique, intertwining cathedral design. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gemma';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gemma-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gemma-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gemma-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gemma/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gemma/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gemma-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gemma-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gemma-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gemma-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gemma-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gemma-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gemma-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gemma-size-0', 1, v_id, 'D'),
      ('ring-gemma-size-1', 2, v_id, 'E'),
      ('ring-gemma-size-2', 3, v_id, 'F'),
      ('ring-gemma-size-3', 4, v_id, 'G'),
      ('ring-gemma-size-4', 5, v_id, 'H'),
      ('ring-gemma-size-5', 6, v_id, 'I'),
      ('ring-gemma-size-6', 7, v_id, 'J'),
      ('ring-gemma-size-7', 8, v_id, 'K'),
      ('ring-gemma-size-8', 9, v_id, 'L'),
      ('ring-gemma-size-9', 10, v_id, 'M'),
      ('ring-gemma-size-10', 11, v_id, 'N'),
      ('ring-gemma-size-11', 12, v_id, 'O'),
      ('ring-gemma-size-12', 13, v_id, 'P'),
      ('ring-gemma-size-13', 14, v_id, 'Q'),
      ('ring-gemma-size-14', 15, v_id, 'R'),
      ('ring-gemma-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gemma-specs',
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
    'ring-genevieve',
    'Genevieve',
    'Genevieve - Marquise 4 Claw Solitaire Engagement Ring',
    'Genevieve is a beautiful solitaire engagement ring showcasing a striking marquise cut centre stone held by four eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-genevieve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-genevieve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-genevieve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-genevieve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/genevieve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/genevieve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-genevieve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-genevieve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-genevieve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-genevieve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-genevieve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-genevieve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-genevieve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-genevieve-size-0', 1, v_id, 'D'),
      ('ring-genevieve-size-1', 2, v_id, 'E'),
      ('ring-genevieve-size-2', 3, v_id, 'F'),
      ('ring-genevieve-size-3', 4, v_id, 'G'),
      ('ring-genevieve-size-4', 5, v_id, 'H'),
      ('ring-genevieve-size-5', 6, v_id, 'I'),
      ('ring-genevieve-size-6', 7, v_id, 'J'),
      ('ring-genevieve-size-7', 8, v_id, 'K'),
      ('ring-genevieve-size-8', 9, v_id, 'L'),
      ('ring-genevieve-size-9', 10, v_id, 'M'),
      ('ring-genevieve-size-10', 11, v_id, 'N'),
      ('ring-genevieve-size-11', 12, v_id, 'O'),
      ('ring-genevieve-size-12', 13, v_id, 'P'),
      ('ring-genevieve-size-13', 14, v_id, 'Q'),
      ('ring-genevieve-size-14', 15, v_id, 'R'),
      ('ring-genevieve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-genevieve-specs',
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
    'ring-georgia',
    'Georgia',
    'Georgia - Round 4 Claw Solitaire with Flat Band and Cathedral Setting Engagement Ring',
    'Timeless in design, Georgia is a round solitaire engagement ring with four round claws and a beautiful cathedral setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-georgia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-georgia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-georgia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-georgia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/georgia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/georgia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-georgia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-georgia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-georgia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-georgia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-georgia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-georgia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-georgia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-georgia-size-0', 1, v_id, 'D'),
      ('ring-georgia-size-1', 2, v_id, 'E'),
      ('ring-georgia-size-2', 3, v_id, 'F'),
      ('ring-georgia-size-3', 4, v_id, 'G'),
      ('ring-georgia-size-4', 5, v_id, 'H'),
      ('ring-georgia-size-5', 6, v_id, 'I'),
      ('ring-georgia-size-6', 7, v_id, 'J'),
      ('ring-georgia-size-7', 8, v_id, 'K'),
      ('ring-georgia-size-8', 9, v_id, 'L'),
      ('ring-georgia-size-9', 10, v_id, 'M'),
      ('ring-georgia-size-10', 11, v_id, 'N'),
      ('ring-georgia-size-11', 12, v_id, 'O'),
      ('ring-georgia-size-12', 13, v_id, 'P'),
      ('ring-georgia-size-13', 14, v_id, 'Q'),
      ('ring-georgia-size-14', 15, v_id, 'R'),
      ('ring-georgia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-georgia-specs',
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
    'ring-gigi',
    'Gigi',
    'Gigi - Marquise 6 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'Gigi is a sophisticated 6-claw marquise solitaire defined by its thick cigar band, which offers a bold yet timelessly classic look. Complete with a sparkling hidden halo, this graceful engagement ring is available in both high and low setting heights. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gigi';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gigi-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gigi-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gigi-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gigi/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gigi/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gigi-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gigi-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gigi-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gigi-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gigi-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gigi-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gigi-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gigi-size-0', 1, v_id, 'D'),
      ('ring-gigi-size-1', 2, v_id, 'E'),
      ('ring-gigi-size-2', 3, v_id, 'F'),
      ('ring-gigi-size-3', 4, v_id, 'G'),
      ('ring-gigi-size-4', 5, v_id, 'H'),
      ('ring-gigi-size-5', 6, v_id, 'I'),
      ('ring-gigi-size-6', 7, v_id, 'J'),
      ('ring-gigi-size-7', 8, v_id, 'K'),
      ('ring-gigi-size-8', 9, v_id, 'L'),
      ('ring-gigi-size-9', 10, v_id, 'M'),
      ('ring-gigi-size-10', 11, v_id, 'N'),
      ('ring-gigi-size-11', 12, v_id, 'O'),
      ('ring-gigi-size-12', 13, v_id, 'P'),
      ('ring-gigi-size-13', 14, v_id, 'Q'),
      ('ring-gigi-size-14', 15, v_id, 'R'),
      ('ring-gigi-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gigi-specs',
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
    'ring-ginny',
    'Ginny',
    'Ginny - Radiant 8 Claw Trilogy with Pear Side Stones and Pave Band Engagement Ring',
    'Ginny is an exquisite trilogy engagement ring showcasing a radiant cut centre stone and two pear side stones atop a cathedral 2/3 pavè band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'radiant'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-ginny';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-ginny-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ginny-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-ginny-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/ginny/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/ginny/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-ginny-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-ginny-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-ginny-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-ginny-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-ginny-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-ginny-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-ginny-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-ginny-size-0', 1, v_id, 'D'),
      ('ring-ginny-size-1', 2, v_id, 'E'),
      ('ring-ginny-size-2', 3, v_id, 'F'),
      ('ring-ginny-size-3', 4, v_id, 'G'),
      ('ring-ginny-size-4', 5, v_id, 'H'),
      ('ring-ginny-size-5', 6, v_id, 'I'),
      ('ring-ginny-size-6', 7, v_id, 'J'),
      ('ring-ginny-size-7', 8, v_id, 'K'),
      ('ring-ginny-size-8', 9, v_id, 'L'),
      ('ring-ginny-size-9', 10, v_id, 'M'),
      ('ring-ginny-size-10', 11, v_id, 'N'),
      ('ring-ginny-size-11', 12, v_id, 'O'),
      ('ring-ginny-size-12', 13, v_id, 'P'),
      ('ring-ginny-size-13', 14, v_id, 'Q'),
      ('ring-ginny-size-14', 15, v_id, 'R'),
      ('ring-ginny-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-ginny-specs',
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