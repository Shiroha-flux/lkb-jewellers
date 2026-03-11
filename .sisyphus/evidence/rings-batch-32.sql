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