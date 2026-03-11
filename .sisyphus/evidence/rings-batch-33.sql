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