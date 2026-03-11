DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-amanda',
    'Amanda',
    'Amanda - Round 6 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Amanda''s elegant design boasts a 6-claw round solitaire, wrap-around hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amanda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amanda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amanda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amanda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amanda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amanda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amanda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amanda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amanda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amanda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amanda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amanda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amanda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amanda-size-0', 1, v_id, 'D'),
      ('ring-amanda-size-1', 2, v_id, 'E'),
      ('ring-amanda-size-2', 3, v_id, 'F'),
      ('ring-amanda-size-3', 4, v_id, 'G'),
      ('ring-amanda-size-4', 5, v_id, 'H'),
      ('ring-amanda-size-5', 6, v_id, 'I'),
      ('ring-amanda-size-6', 7, v_id, 'J'),
      ('ring-amanda-size-7', 8, v_id, 'K'),
      ('ring-amanda-size-8', 9, v_id, 'L'),
      ('ring-amanda-size-9', 10, v_id, 'M'),
      ('ring-amanda-size-10', 11, v_id, 'N'),
      ('ring-amanda-size-11', 12, v_id, 'O'),
      ('ring-amanda-size-12', 13, v_id, 'P'),
      ('ring-amanda-size-13', 14, v_id, 'Q'),
      ('ring-amanda-size-14', 15, v_id, 'R'),
      ('ring-amanda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amanda-specs',
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
    'ring-amor',
    'Amor',
    'Amor - Pear and Emerald Claw Toi et Moi Engagement Ring',
    'The Amor toi et moi engagement ring presents the striking balance between a pear and emerald cut stone, emphasised by a sleek and minimal band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amor';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amor-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amor-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amor-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amor/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amor/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amor-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amor-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amor-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amor-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amor-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amor-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amor-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amor-size-0', 1, v_id, 'D'),
      ('ring-amor-size-1', 2, v_id, 'E'),
      ('ring-amor-size-2', 3, v_id, 'F'),
      ('ring-amor-size-3', 4, v_id, 'G'),
      ('ring-amor-size-4', 5, v_id, 'H'),
      ('ring-amor-size-5', 6, v_id, 'I'),
      ('ring-amor-size-6', 7, v_id, 'J'),
      ('ring-amor-size-7', 8, v_id, 'K'),
      ('ring-amor-size-8', 9, v_id, 'L'),
      ('ring-amor-size-9', 10, v_id, 'M'),
      ('ring-amor-size-10', 11, v_id, 'N'),
      ('ring-amor-size-11', 12, v_id, 'O'),
      ('ring-amor-size-12', 13, v_id, 'P'),
      ('ring-amor-size-13', 14, v_id, 'Q'),
      ('ring-amor-size-14', 15, v_id, 'R'),
      ('ring-amor-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amor-specs',
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
    'ring-amy',
    'Amy',
    'Amy – 3 Claw Pear Solitaire',
    'Minimal and classic, Amy is a signature 3-claw pear solitaire engagement ring. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-amy';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-amy-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amy-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-amy-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/amy/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/amy/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-amy-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-amy-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-amy-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-amy-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-amy-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-amy-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-amy-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-amy-size-0', 1, v_id, 'D'),
      ('ring-amy-size-1', 2, v_id, 'E'),
      ('ring-amy-size-2', 3, v_id, 'F'),
      ('ring-amy-size-3', 4, v_id, 'G'),
      ('ring-amy-size-4', 5, v_id, 'H'),
      ('ring-amy-size-5', 6, v_id, 'I'),
      ('ring-amy-size-6', 7, v_id, 'J'),
      ('ring-amy-size-7', 8, v_id, 'K'),
      ('ring-amy-size-8', 9, v_id, 'L'),
      ('ring-amy-size-9', 10, v_id, 'M'),
      ('ring-amy-size-10', 11, v_id, 'N'),
      ('ring-amy-size-11', 12, v_id, 'O'),
      ('ring-amy-size-12', 13, v_id, 'P'),
      ('ring-amy-size-13', 14, v_id, 'Q'),
      ('ring-amy-size-14', 15, v_id, 'R'),
      ('ring-amy-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-amy-specs',
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
    'ring-analyce',
    'Analyce',
    'Analyce - Emerald 4 Claw Solitaire with Halo and Pave Band Engagement Ring',
    'The Analyce engagement ring is a glamorous emerald halo design complete with a 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-analyce';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-analyce-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-analyce-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-analyce-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/analyce/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/analyce/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-analyce-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-analyce-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-analyce-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-analyce-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-analyce-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-analyce-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-analyce-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-analyce-size-0', 1, v_id, 'D'),
      ('ring-analyce-size-1', 2, v_id, 'E'),
      ('ring-analyce-size-2', 3, v_id, 'F'),
      ('ring-analyce-size-3', 4, v_id, 'G'),
      ('ring-analyce-size-4', 5, v_id, 'H'),
      ('ring-analyce-size-5', 6, v_id, 'I'),
      ('ring-analyce-size-6', 7, v_id, 'J'),
      ('ring-analyce-size-7', 8, v_id, 'K'),
      ('ring-analyce-size-8', 9, v_id, 'L'),
      ('ring-analyce-size-9', 10, v_id, 'M'),
      ('ring-analyce-size-10', 11, v_id, 'N'),
      ('ring-analyce-size-11', 12, v_id, 'O'),
      ('ring-analyce-size-12', 13, v_id, 'P'),
      ('ring-analyce-size-13', 14, v_id, 'Q'),
      ('ring-analyce-size-14', 15, v_id, 'R'),
      ('ring-analyce-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-analyce-specs',
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
    'ring-angelina',
    'Angelina',
    'Angelina - Radiant 4 Claw Solitaire with Cigar Band and Hidden Halo Engagement Ring',
    'The Angelina engagement ring adds a boldness to the traditional 4-claw radiant solitaire design with a striking cigar band and sparkling hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-angelina';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-angelina-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-angelina-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-angelina-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/angelina/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/angelina/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-angelina-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-angelina-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-angelina-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-angelina-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-angelina-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-angelina-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-angelina-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-angelina-size-0', 1, v_id, 'D'),
      ('ring-angelina-size-1', 2, v_id, 'E'),
      ('ring-angelina-size-2', 3, v_id, 'F'),
      ('ring-angelina-size-3', 4, v_id, 'G'),
      ('ring-angelina-size-4', 5, v_id, 'H'),
      ('ring-angelina-size-5', 6, v_id, 'I'),
      ('ring-angelina-size-6', 7, v_id, 'J'),
      ('ring-angelina-size-7', 8, v_id, 'K'),
      ('ring-angelina-size-8', 9, v_id, 'L'),
      ('ring-angelina-size-9', 10, v_id, 'M'),
      ('ring-angelina-size-10', 11, v_id, 'N'),
      ('ring-angelina-size-11', 12, v_id, 'O'),
      ('ring-angelina-size-12', 13, v_id, 'P'),
      ('ring-angelina-size-13', 14, v_id, 'Q'),
      ('ring-angelina-size-14', 15, v_id, 'R'),
      ('ring-angelina-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-angelina-specs',
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