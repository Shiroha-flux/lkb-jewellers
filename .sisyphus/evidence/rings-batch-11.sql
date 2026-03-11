DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-cali',
    'Cali',
    'Cali - Elongated Cushion 4 Claw Solitaire with Marquise-Round Accent Stones and Hidden Halo Engagement Ring',
    'Cali is a graceful elongated cushion solitaire design elevated by a sleek band featuring an alternating pattern of round and marquise cut side stones. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cali';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cali-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cali/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cali/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cali-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cali/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cali/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cali-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cali/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cali/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cali-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cali-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cali-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cali-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cali-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cali-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cali-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cali-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cali-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cali-size-0', 1, v_id, 'D'),
      ('ring-cali-size-1', 2, v_id, 'E'),
      ('ring-cali-size-2', 3, v_id, 'F'),
      ('ring-cali-size-3', 4, v_id, 'G'),
      ('ring-cali-size-4', 5, v_id, 'H'),
      ('ring-cali-size-5', 6, v_id, 'I'),
      ('ring-cali-size-6', 7, v_id, 'J'),
      ('ring-cali-size-7', 8, v_id, 'K'),
      ('ring-cali-size-8', 9, v_id, 'L'),
      ('ring-cali-size-9', 10, v_id, 'M'),
      ('ring-cali-size-10', 11, v_id, 'N'),
      ('ring-cali-size-11', 12, v_id, 'O'),
      ('ring-cali-size-12', 13, v_id, 'P'),
      ('ring-cali-size-13', 14, v_id, 'Q'),
      ('ring-cali-size-14', 15, v_id, 'R'),
      ('ring-cali-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cali-specs',
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
    'ring-camilla',
    'Camilla',
    'Camilla - Elongated Cushion 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Starring an elegant elongated cushion centre stone, Camilla is a beautiful 4-claw design complete with a hidden halo and half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-camilla';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-camilla-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/camilla/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/camilla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-camilla-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/camilla/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/camilla/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-camilla-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/camilla/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/camilla/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-camilla-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-camilla-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-camilla-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-camilla-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-camilla-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-camilla-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-camilla-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-camilla-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-camilla-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-camilla-size-0', 1, v_id, 'D'),
      ('ring-camilla-size-1', 2, v_id, 'E'),
      ('ring-camilla-size-2', 3, v_id, 'F'),
      ('ring-camilla-size-3', 4, v_id, 'G'),
      ('ring-camilla-size-4', 5, v_id, 'H'),
      ('ring-camilla-size-5', 6, v_id, 'I'),
      ('ring-camilla-size-6', 7, v_id, 'J'),
      ('ring-camilla-size-7', 8, v_id, 'K'),
      ('ring-camilla-size-8', 9, v_id, 'L'),
      ('ring-camilla-size-9', 10, v_id, 'M'),
      ('ring-camilla-size-10', 11, v_id, 'N'),
      ('ring-camilla-size-11', 12, v_id, 'O'),
      ('ring-camilla-size-12', 13, v_id, 'P'),
      ('ring-camilla-size-13', 14, v_id, 'Q'),
      ('ring-camilla-size-14', 15, v_id, 'R'),
      ('ring-camilla-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-camilla-specs',
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
    'ring-candice',
    'Candice',
    'Candice - Pear Claw Solitaire with Double Pave and Plain Band Engagement Ring',
    'Candice is a jaw-dropping double band pear solitaire complete with a 5-claw basket-set centre stone and half pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-candice';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-candice-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/candice/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/candice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-candice-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/candice/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/candice/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-candice-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/candice/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/candice/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-candice-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-candice-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-candice-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-candice-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-candice-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-candice-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-candice-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-candice-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-candice-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-candice-size-0', 1, v_id, 'D'),
      ('ring-candice-size-1', 2, v_id, 'E'),
      ('ring-candice-size-2', 3, v_id, 'F'),
      ('ring-candice-size-3', 4, v_id, 'G'),
      ('ring-candice-size-4', 5, v_id, 'H'),
      ('ring-candice-size-5', 6, v_id, 'I'),
      ('ring-candice-size-6', 7, v_id, 'J'),
      ('ring-candice-size-7', 8, v_id, 'K'),
      ('ring-candice-size-8', 9, v_id, 'L'),
      ('ring-candice-size-9', 10, v_id, 'M'),
      ('ring-candice-size-10', 11, v_id, 'N'),
      ('ring-candice-size-11', 12, v_id, 'O'),
      ('ring-candice-size-12', 13, v_id, 'P'),
      ('ring-candice-size-13', 14, v_id, 'Q'),
      ('ring-candice-size-14', 15, v_id, 'R'),
      ('ring-candice-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-candice-specs',
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
    'ring-carly',
    'Carly',
    'Carly - Radiant 4 Claw Solitaire with Hidden Halo Engagement Ring',
    'Stunning in its simplicity, the Carly engagement ring is a classic radiant solitaire design featuring four eagle-tipped claws and a hidden halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-carly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-carly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-carly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-carly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-carly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-carly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-carly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-carly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-carly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-carly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-carly-size-0', 1, v_id, 'D'),
      ('ring-carly-size-1', 2, v_id, 'E'),
      ('ring-carly-size-2', 3, v_id, 'F'),
      ('ring-carly-size-3', 4, v_id, 'G'),
      ('ring-carly-size-4', 5, v_id, 'H'),
      ('ring-carly-size-5', 6, v_id, 'I'),
      ('ring-carly-size-6', 7, v_id, 'J'),
      ('ring-carly-size-7', 8, v_id, 'K'),
      ('ring-carly-size-8', 9, v_id, 'L'),
      ('ring-carly-size-9', 10, v_id, 'M'),
      ('ring-carly-size-10', 11, v_id, 'N'),
      ('ring-carly-size-11', 12, v_id, 'O'),
      ('ring-carly-size-12', 13, v_id, 'P'),
      ('ring-carly-size-13', 14, v_id, 'Q'),
      ('ring-carly-size-14', 15, v_id, 'R'),
      ('ring-carly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-carly-specs',
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
    'ring-carmella',
    'Carmella',
    'Carmella - Emerald 4 Claw Solitaire with Flat Cigar Band and Hidden Halo Engagement Ring',
    'Carmella reimagines the classic four-claw emerald-cut solitaire with a flat, straight-edge cigar band. A discreet hidden halo adds light beneath the stone, while the band’s clean width gives the ring its quiet strength – whether worn alone or layered. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-carmella';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-carmella-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carmella/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carmella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-carmella-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carmella/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carmella/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-carmella-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/carmella/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/carmella/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carmella-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-carmella-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-carmella-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-carmella-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carmella-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-carmella-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-carmella-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-carmella-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-carmella-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-carmella-size-0', 1, v_id, 'D'),
      ('ring-carmella-size-1', 2, v_id, 'E'),
      ('ring-carmella-size-2', 3, v_id, 'F'),
      ('ring-carmella-size-3', 4, v_id, 'G'),
      ('ring-carmella-size-4', 5, v_id, 'H'),
      ('ring-carmella-size-5', 6, v_id, 'I'),
      ('ring-carmella-size-6', 7, v_id, 'J'),
      ('ring-carmella-size-7', 8, v_id, 'K'),
      ('ring-carmella-size-8', 9, v_id, 'L'),
      ('ring-carmella-size-9', 10, v_id, 'M'),
      ('ring-carmella-size-10', 11, v_id, 'N'),
      ('ring-carmella-size-11', 12, v_id, 'O'),
      ('ring-carmella-size-12', 13, v_id, 'P'),
      ('ring-carmella-size-13', 14, v_id, 'Q'),
      ('ring-carmella-size-14', 15, v_id, 'R'),
      ('ring-carmella-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-carmella-specs',
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