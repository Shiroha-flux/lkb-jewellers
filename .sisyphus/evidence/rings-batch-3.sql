DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-alia',
    'Alia',
    'Alia - Pear 5 Claw Solitaire Engagement Ring',
    'Minimal in design, the Alia engagement ring boasts a stunning pear cut centre stone framed by five eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alia-size-0', 1, v_id, 'D'),
      ('ring-alia-size-1', 2, v_id, 'E'),
      ('ring-alia-size-2', 3, v_id, 'F'),
      ('ring-alia-size-3', 4, v_id, 'G'),
      ('ring-alia-size-4', 5, v_id, 'H'),
      ('ring-alia-size-5', 6, v_id, 'I'),
      ('ring-alia-size-6', 7, v_id, 'J'),
      ('ring-alia-size-7', 8, v_id, 'K'),
      ('ring-alia-size-8', 9, v_id, 'L'),
      ('ring-alia-size-9', 10, v_id, 'M'),
      ('ring-alia-size-10', 11, v_id, 'N'),
      ('ring-alia-size-11', 12, v_id, 'O'),
      ('ring-alia-size-12', 13, v_id, 'P'),
      ('ring-alia-size-13', 14, v_id, 'Q'),
      ('ring-alia-size-14', 15, v_id, 'R'),
      ('ring-alia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alia-specs',
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
    'ring-alice',
    'Alice',
    'Alice - Emerald 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'The Alice engagement ring features a bold emerald solitaire and sparkling hidden halo seated atop a minimal band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alice';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alice-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alice-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alice-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alice/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alice/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alice-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alice-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alice-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alice-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alice-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alice-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alice-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alice-size-0', 1, v_id, 'D'),
      ('ring-alice-size-1', 2, v_id, 'E'),
      ('ring-alice-size-2', 3, v_id, 'F'),
      ('ring-alice-size-3', 4, v_id, 'G'),
      ('ring-alice-size-4', 5, v_id, 'H'),
      ('ring-alice-size-5', 6, v_id, 'I'),
      ('ring-alice-size-6', 7, v_id, 'J'),
      ('ring-alice-size-7', 8, v_id, 'K'),
      ('ring-alice-size-8', 9, v_id, 'L'),
      ('ring-alice-size-9', 10, v_id, 'M'),
      ('ring-alice-size-10', 11, v_id, 'N'),
      ('ring-alice-size-11', 12, v_id, 'O'),
      ('ring-alice-size-12', 13, v_id, 'P'),
      ('ring-alice-size-13', 14, v_id, 'Q'),
      ('ring-alice-size-14', 15, v_id, 'R'),
      ('ring-alice-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alice-specs',
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
    'ring-alina',
    'Alina',
    'Alina - Emerald 4 Claw Solitaire Engagement Ring',
    'Alina is a classic emerald solitaire engagement ring held within four eagle-tipped claws and seated atop a sleek band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alina-size-0', 1, v_id, 'D'),
      ('ring-alina-size-1', 2, v_id, 'E'),
      ('ring-alina-size-2', 3, v_id, 'F'),
      ('ring-alina-size-3', 4, v_id, 'G'),
      ('ring-alina-size-4', 5, v_id, 'H'),
      ('ring-alina-size-5', 6, v_id, 'I'),
      ('ring-alina-size-6', 7, v_id, 'J'),
      ('ring-alina-size-7', 8, v_id, 'K'),
      ('ring-alina-size-8', 9, v_id, 'L'),
      ('ring-alina-size-9', 10, v_id, 'M'),
      ('ring-alina-size-10', 11, v_id, 'N'),
      ('ring-alina-size-11', 12, v_id, 'O'),
      ('ring-alina-size-12', 13, v_id, 'P'),
      ('ring-alina-size-13', 14, v_id, 'Q'),
      ('ring-alina-size-14', 15, v_id, 'R'),
      ('ring-alina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alina-specs',
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
    'ring-allison',
    'Allison',
    'Allison - Oval 6 Claw Solitaire with East West Setting Engagement Ring',
    'The Allison engagement ring adds a contemporary twist to a classic design with a beautiful east-to-west oval cut centre stone and 6-claw setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-allison';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-allison-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-allison-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-allison-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/allison/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/allison/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-allison-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-allison-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-allison-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-allison-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-allison-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-allison-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-allison-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-allison-size-0', 1, v_id, 'D'),
      ('ring-allison-size-1', 2, v_id, 'E'),
      ('ring-allison-size-2', 3, v_id, 'F'),
      ('ring-allison-size-3', 4, v_id, 'G'),
      ('ring-allison-size-4', 5, v_id, 'H'),
      ('ring-allison-size-5', 6, v_id, 'I'),
      ('ring-allison-size-6', 7, v_id, 'J'),
      ('ring-allison-size-7', 8, v_id, 'K'),
      ('ring-allison-size-8', 9, v_id, 'L'),
      ('ring-allison-size-9', 10, v_id, 'M'),
      ('ring-allison-size-10', 11, v_id, 'N'),
      ('ring-allison-size-11', 12, v_id, 'O'),
      ('ring-allison-size-12', 13, v_id, 'P'),
      ('ring-allison-size-13', 14, v_id, 'Q'),
      ('ring-allison-size-14', 15, v_id, 'R'),
      ('ring-allison-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-allison-specs',
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
    'ring-alyssa',
    'Alyssa',
    'Alyssa - Oval 4 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'The popular Alyssa design presents a stunning oval cut centre stone and a sleek band featuring two pairs of round and marquise cut side stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-alyssa';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-alyssa-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alyssa-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-alyssa-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/alyssa/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/alyssa/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-alyssa-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-alyssa-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-alyssa-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-alyssa-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-alyssa-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-alyssa-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-alyssa-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-alyssa-size-0', 1, v_id, 'D'),
      ('ring-alyssa-size-1', 2, v_id, 'E'),
      ('ring-alyssa-size-2', 3, v_id, 'F'),
      ('ring-alyssa-size-3', 4, v_id, 'G'),
      ('ring-alyssa-size-4', 5, v_id, 'H'),
      ('ring-alyssa-size-5', 6, v_id, 'I'),
      ('ring-alyssa-size-6', 7, v_id, 'J'),
      ('ring-alyssa-size-7', 8, v_id, 'K'),
      ('ring-alyssa-size-8', 9, v_id, 'L'),
      ('ring-alyssa-size-9', 10, v_id, 'M'),
      ('ring-alyssa-size-10', 11, v_id, 'N'),
      ('ring-alyssa-size-11', 12, v_id, 'O'),
      ('ring-alyssa-size-12', 13, v_id, 'P'),
      ('ring-alyssa-size-13', 14, v_id, 'Q'),
      ('ring-alyssa-size-14', 15, v_id, 'R'),
      ('ring-alyssa-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-alyssa-specs',
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