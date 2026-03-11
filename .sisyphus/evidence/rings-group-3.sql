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

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-caroline',
    'Caroline',
    'Caroline - Round 6 Claw Solitaire with Knife Edge Band Engagement Ring',
    'Arguably the most iconic solitaire design in history, the stunning Caroline engagement ring features a round cut centre stone, high-set 6-claw setting and knife-edge band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-caroline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-caroline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-caroline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-caroline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/caroline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/caroline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-caroline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-caroline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-caroline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-caroline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-caroline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-caroline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-caroline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-caroline-size-0', 1, v_id, 'D'),
      ('ring-caroline-size-1', 2, v_id, 'E'),
      ('ring-caroline-size-2', 3, v_id, 'F'),
      ('ring-caroline-size-3', 4, v_id, 'G'),
      ('ring-caroline-size-4', 5, v_id, 'H'),
      ('ring-caroline-size-5', 6, v_id, 'I'),
      ('ring-caroline-size-6', 7, v_id, 'J'),
      ('ring-caroline-size-7', 8, v_id, 'K'),
      ('ring-caroline-size-8', 9, v_id, 'L'),
      ('ring-caroline-size-9', 10, v_id, 'M'),
      ('ring-caroline-size-10', 11, v_id, 'N'),
      ('ring-caroline-size-11', 12, v_id, 'O'),
      ('ring-caroline-size-12', 13, v_id, 'P'),
      ('ring-caroline-size-13', 14, v_id, 'Q'),
      ('ring-caroline-size-14', 15, v_id, 'R'),
      ('ring-caroline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-caroline-specs',
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
    'ring-cartia',
    'Cartia',
    'Cartia - Round Claw Solitaire with Round-Marquise Bezel Accent Stones Engagement Ring',
    'The Cartia design features a 4-claw round cut centre stone, balanced by a sleek band. Bezel-set round and marquise side stones bring subtle dimension and architectural detail to the design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'round'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cartia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cartia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cartia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cartia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cartia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cartia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cartia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cartia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cartia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cartia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cartia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cartia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cartia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cartia-size-0', 1, v_id, 'D'),
      ('ring-cartia-size-1', 2, v_id, 'E'),
      ('ring-cartia-size-2', 3, v_id, 'F'),
      ('ring-cartia-size-3', 4, v_id, 'G'),
      ('ring-cartia-size-4', 5, v_id, 'H'),
      ('ring-cartia-size-5', 6, v_id, 'I'),
      ('ring-cartia-size-6', 7, v_id, 'J'),
      ('ring-cartia-size-7', 8, v_id, 'K'),
      ('ring-cartia-size-8', 9, v_id, 'L'),
      ('ring-cartia-size-9', 10, v_id, 'M'),
      ('ring-cartia-size-10', 11, v_id, 'N'),
      ('ring-cartia-size-11', 12, v_id, 'O'),
      ('ring-cartia-size-12', 13, v_id, 'P'),
      ('ring-cartia-size-13', 14, v_id, 'Q'),
      ('ring-cartia-size-14', 15, v_id, 'R'),
      ('ring-cartia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cartia-specs',
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
    'ring-casey',
    'Casey',
    'Casey - Oval East West Claw Solitaire with Bypass Band  Engagement Ring',
    'Casey centres an oval stone in a four-claw east–west setting, supported by a gently twisting bypass band. Soft curves wrap around the basket, creating a light, contemporary silhouette with sculptural balance. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-casey';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-casey-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-casey-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-casey-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/casey/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/casey/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-casey-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-casey-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-casey-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-casey-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-casey-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-casey-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-casey-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-casey-size-0', 1, v_id, 'D'),
      ('ring-casey-size-1', 2, v_id, 'E'),
      ('ring-casey-size-2', 3, v_id, 'F'),
      ('ring-casey-size-3', 4, v_id, 'G'),
      ('ring-casey-size-4', 5, v_id, 'H'),
      ('ring-casey-size-5', 6, v_id, 'I'),
      ('ring-casey-size-6', 7, v_id, 'J'),
      ('ring-casey-size-7', 8, v_id, 'K'),
      ('ring-casey-size-8', 9, v_id, 'L'),
      ('ring-casey-size-9', 10, v_id, 'M'),
      ('ring-casey-size-10', 11, v_id, 'N'),
      ('ring-casey-size-11', 12, v_id, 'O'),
      ('ring-casey-size-12', 13, v_id, 'P'),
      ('ring-casey-size-13', 14, v_id, 'Q'),
      ('ring-casey-size-14', 15, v_id, 'R'),
      ('ring-casey-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-casey-specs',
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
    'ring-cataleya',
    'Cataleya',
    'Cataleya - Elongated Cushion 4 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'Cataleya is a stunning elongated cushion trilogy with pear cut side stones and cathedral arches. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cataleya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cataleya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cataleya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cataleya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cataleya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cataleya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cataleya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cataleya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cataleya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cataleya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cataleya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cataleya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cataleya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cataleya-size-0', 1, v_id, 'D'),
      ('ring-cataleya-size-1', 2, v_id, 'E'),
      ('ring-cataleya-size-2', 3, v_id, 'F'),
      ('ring-cataleya-size-3', 4, v_id, 'G'),
      ('ring-cataleya-size-4', 5, v_id, 'H'),
      ('ring-cataleya-size-5', 6, v_id, 'I'),
      ('ring-cataleya-size-6', 7, v_id, 'J'),
      ('ring-cataleya-size-7', 8, v_id, 'K'),
      ('ring-cataleya-size-8', 9, v_id, 'L'),
      ('ring-cataleya-size-9', 10, v_id, 'M'),
      ('ring-cataleya-size-10', 11, v_id, 'N'),
      ('ring-cataleya-size-11', 12, v_id, 'O'),
      ('ring-cataleya-size-12', 13, v_id, 'P'),
      ('ring-cataleya-size-13', 14, v_id, 'Q'),
      ('ring-cataleya-size-14', 15, v_id, 'R'),
      ('ring-cataleya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cataleya-specs',
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
    'ring-cecilia',
    'Cecilia',
    'Cecilia - Oval 4 Claw Solitaire with Wrap Around Hidden Halo Engagement Ring',
    'The elegant Cecilia engagement ring is a 4-claw oval solitaire with a dazzling wrap-around halo. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cecilia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cecilia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cecilia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cecilia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cecilia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cecilia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cecilia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cecilia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cecilia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cecilia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cecilia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cecilia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cecilia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cecilia-size-0', 1, v_id, 'D'),
      ('ring-cecilia-size-1', 2, v_id, 'E'),
      ('ring-cecilia-size-2', 3, v_id, 'F'),
      ('ring-cecilia-size-3', 4, v_id, 'G'),
      ('ring-cecilia-size-4', 5, v_id, 'H'),
      ('ring-cecilia-size-5', 6, v_id, 'I'),
      ('ring-cecilia-size-6', 7, v_id, 'J'),
      ('ring-cecilia-size-7', 8, v_id, 'K'),
      ('ring-cecilia-size-8', 9, v_id, 'L'),
      ('ring-cecilia-size-9', 10, v_id, 'M'),
      ('ring-cecilia-size-10', 11, v_id, 'N'),
      ('ring-cecilia-size-11', 12, v_id, 'O'),
      ('ring-cecilia-size-12', 13, v_id, 'P'),
      ('ring-cecilia-size-13', 14, v_id, 'Q'),
      ('ring-cecilia-size-14', 15, v_id, 'R'),
      ('ring-cecilia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cecilia-specs',
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
    'ring-chantelle',
    'Chantelle',
    'Chantelle - Marquise 6 Claw Trilogy with Pear Side Stones and Cathedral Setting Engagement Ring',
    'Chantelle centres a marquise stone with pear-cut accents on either side, brought together by a cathedral setting that creates a refined, harmonious three-stone silhouette. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'pear'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-chantelle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-chantelle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-chantelle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-chantelle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/chantelle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/chantelle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-chantelle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-chantelle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-chantelle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-chantelle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-chantelle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-chantelle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-chantelle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-chantelle-size-0', 1, v_id, 'D'),
      ('ring-chantelle-size-1', 2, v_id, 'E'),
      ('ring-chantelle-size-2', 3, v_id, 'F'),
      ('ring-chantelle-size-3', 4, v_id, 'G'),
      ('ring-chantelle-size-4', 5, v_id, 'H'),
      ('ring-chantelle-size-5', 6, v_id, 'I'),
      ('ring-chantelle-size-6', 7, v_id, 'J'),
      ('ring-chantelle-size-7', 8, v_id, 'K'),
      ('ring-chantelle-size-8', 9, v_id, 'L'),
      ('ring-chantelle-size-9', 10, v_id, 'M'),
      ('ring-chantelle-size-10', 11, v_id, 'N'),
      ('ring-chantelle-size-11', 12, v_id, 'O'),
      ('ring-chantelle-size-12', 13, v_id, 'P'),
      ('ring-chantelle-size-13', 14, v_id, 'Q'),
      ('ring-chantelle-size-14', 15, v_id, 'R'),
      ('ring-chantelle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-chantelle-specs',
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
    'ring-charlie',
    'Charlie',
    'Charlie - Round 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Charlie is a sophisticated round solitaire featuring four round claws, 2/3 pavé band and a gorgeous hidden halo for extra sparkle. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-charlie';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-charlie-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charlie-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charlie-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charlie/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charlie/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-charlie-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-charlie-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-charlie-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-charlie-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charlie-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-charlie-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-charlie-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-charlie-size-0', 1, v_id, 'D'),
      ('ring-charlie-size-1', 2, v_id, 'E'),
      ('ring-charlie-size-2', 3, v_id, 'F'),
      ('ring-charlie-size-3', 4, v_id, 'G'),
      ('ring-charlie-size-4', 5, v_id, 'H'),
      ('ring-charlie-size-5', 6, v_id, 'I'),
      ('ring-charlie-size-6', 7, v_id, 'J'),
      ('ring-charlie-size-7', 8, v_id, 'K'),
      ('ring-charlie-size-8', 9, v_id, 'L'),
      ('ring-charlie-size-9', 10, v_id, 'M'),
      ('ring-charlie-size-10', 11, v_id, 'N'),
      ('ring-charlie-size-11', 12, v_id, 'O'),
      ('ring-charlie-size-12', 13, v_id, 'P'),
      ('ring-charlie-size-13', 14, v_id, 'Q'),
      ('ring-charlie-size-14', 15, v_id, 'R'),
      ('ring-charlie-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-charlie-specs',
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
    'ring-charmaine',
    'Charmaine',
    'Charmaine - Elongated Cushion 4 Claw Trilogy with Round Side Stones and Lily Detail Engagement Ring',
    'The Charmaine elongated cushion trilogy design features two round cut side stones and an intricate petal design nestled within a cathedral setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-charmaine';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-charmaine-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charmaine-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-charmaine-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/charmaine/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/charmaine/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-charmaine-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-charmaine-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-charmaine-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-charmaine-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-charmaine-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-charmaine-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-charmaine-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-charmaine-size-0', 1, v_id, 'D'),
      ('ring-charmaine-size-1', 2, v_id, 'E'),
      ('ring-charmaine-size-2', 3, v_id, 'F'),
      ('ring-charmaine-size-3', 4, v_id, 'G'),
      ('ring-charmaine-size-4', 5, v_id, 'H'),
      ('ring-charmaine-size-5', 6, v_id, 'I'),
      ('ring-charmaine-size-6', 7, v_id, 'J'),
      ('ring-charmaine-size-7', 8, v_id, 'K'),
      ('ring-charmaine-size-8', 9, v_id, 'L'),
      ('ring-charmaine-size-9', 10, v_id, 'M'),
      ('ring-charmaine-size-10', 11, v_id, 'N'),
      ('ring-charmaine-size-11', 12, v_id, 'O'),
      ('ring-charmaine-size-12', 13, v_id, 'P'),
      ('ring-charmaine-size-13', 14, v_id, 'Q'),
      ('ring-charmaine-size-14', 15, v_id, 'R'),
      ('ring-charmaine-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-charmaine-specs',
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
    'ring-claudia',
    'Claudia',
    'Claudia - Cushion 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'Claudia is a classic cushion soliatire engagement ring held within four eagle-tipped claws and complete with a hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-claudia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-claudia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-claudia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-claudia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/claudia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/claudia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-claudia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-claudia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-claudia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-claudia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-claudia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-claudia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-claudia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-claudia-size-0', 1, v_id, 'D'),
      ('ring-claudia-size-1', 2, v_id, 'E'),
      ('ring-claudia-size-2', 3, v_id, 'F'),
      ('ring-claudia-size-3', 4, v_id, 'G'),
      ('ring-claudia-size-4', 5, v_id, 'H'),
      ('ring-claudia-size-5', 6, v_id, 'I'),
      ('ring-claudia-size-6', 7, v_id, 'J'),
      ('ring-claudia-size-7', 8, v_id, 'K'),
      ('ring-claudia-size-8', 9, v_id, 'L'),
      ('ring-claudia-size-9', 10, v_id, 'M'),
      ('ring-claudia-size-10', 11, v_id, 'N'),
      ('ring-claudia-size-11', 12, v_id, 'O'),
      ('ring-claudia-size-12', 13, v_id, 'P'),
      ('ring-claudia-size-13', 14, v_id, 'Q'),
      ('ring-claudia-size-14', 15, v_id, 'R'),
      ('ring-claudia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-claudia-specs',
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
    'ring-cynthia',
    'Cynthia',
    'Cynthia - Classic Elongated Hexagon Claw Solitaire Engagement Ring',
    'The Cynthia is defined by an elongated hexagon-cut centre stone, held in place by six eagle-tipped claws and finished with a sleek, refined band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-cynthia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-cynthia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cynthia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-cynthia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/cynthia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/cynthia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-cynthia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-cynthia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-cynthia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-cynthia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-cynthia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-cynthia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-cynthia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-cynthia-size-0', 1, v_id, 'D'),
      ('ring-cynthia-size-1', 2, v_id, 'E'),
      ('ring-cynthia-size-2', 3, v_id, 'F'),
      ('ring-cynthia-size-3', 4, v_id, 'G'),
      ('ring-cynthia-size-4', 5, v_id, 'H'),
      ('ring-cynthia-size-5', 6, v_id, 'I'),
      ('ring-cynthia-size-6', 7, v_id, 'J'),
      ('ring-cynthia-size-7', 8, v_id, 'K'),
      ('ring-cynthia-size-8', 9, v_id, 'L'),
      ('ring-cynthia-size-9', 10, v_id, 'M'),
      ('ring-cynthia-size-10', 11, v_id, 'N'),
      ('ring-cynthia-size-11', 12, v_id, 'O'),
      ('ring-cynthia-size-12', 13, v_id, 'P'),
      ('ring-cynthia-size-13', 14, v_id, 'Q'),
      ('ring-cynthia-size-14', 15, v_id, 'R'),
      ('ring-cynthia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-cynthia-specs',
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

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-daniela',
    'Daniela',
    'Daniela - Round 6 Claw Solitaire with Solid Cathedral High Setting Engagement Ring',
    'Simple and sophisticated, the Daniela engagement ring features a round cut centre stone and six eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-daniela';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-daniela-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daniela-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-daniela-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/daniela/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/daniela/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-daniela-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-daniela-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-daniela-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-daniela-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-daniela-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-daniela-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-daniela-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-daniela-size-0', 1, v_id, 'D'),
      ('ring-daniela-size-1', 2, v_id, 'E'),
      ('ring-daniela-size-2', 3, v_id, 'F'),
      ('ring-daniela-size-3', 4, v_id, 'G'),
      ('ring-daniela-size-4', 5, v_id, 'H'),
      ('ring-daniela-size-5', 6, v_id, 'I'),
      ('ring-daniela-size-6', 7, v_id, 'J'),
      ('ring-daniela-size-7', 8, v_id, 'K'),
      ('ring-daniela-size-8', 9, v_id, 'L'),
      ('ring-daniela-size-9', 10, v_id, 'M'),
      ('ring-daniela-size-10', 11, v_id, 'N'),
      ('ring-daniela-size-11', 12, v_id, 'O'),
      ('ring-daniela-size-12', 13, v_id, 'P'),
      ('ring-daniela-size-13', 14, v_id, 'Q'),
      ('ring-daniela-size-14', 15, v_id, 'R'),
      ('ring-daniela-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-daniela-specs',
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
    'ring-delilah',
    'Delilah',
    'Delilah - Round 6 Claw Solitaire with Trellis Gallery and Cathedral Setting Engagement Ring',
    'Delilah adds flair to the classic round solitaire design with six round claws and a woven trellis setting. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-delilah';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-delilah-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delilah-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delilah-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delilah/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delilah/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-delilah-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-delilah-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-delilah-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-delilah-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delilah-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-delilah-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-delilah-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-delilah-size-0', 1, v_id, 'D'),
      ('ring-delilah-size-1', 2, v_id, 'E'),
      ('ring-delilah-size-2', 3, v_id, 'F'),
      ('ring-delilah-size-3', 4, v_id, 'G'),
      ('ring-delilah-size-4', 5, v_id, 'H'),
      ('ring-delilah-size-5', 6, v_id, 'I'),
      ('ring-delilah-size-6', 7, v_id, 'J'),
      ('ring-delilah-size-7', 8, v_id, 'K'),
      ('ring-delilah-size-8', 9, v_id, 'L'),
      ('ring-delilah-size-9', 10, v_id, 'M'),
      ('ring-delilah-size-10', 11, v_id, 'N'),
      ('ring-delilah-size-11', 12, v_id, 'O'),
      ('ring-delilah-size-12', 13, v_id, 'P'),
      ('ring-delilah-size-13', 14, v_id, 'Q'),
      ('ring-delilah-size-14', 15, v_id, 'R'),
      ('ring-delilah-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-delilah-specs',
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
    'ring-delta',
    'Delta',
    'Delta - Elongated Hexagon 6 Claw Solitaire with Hidden Halo Engagement Ring',
    'The Delta engagement ring is a striking step-cut elongated hexagon solitaire cradled within six eagle-tipped claws and encircled by a sparkling hidden halo. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_hexagon'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-delta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-delta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-delta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/delta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/delta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-delta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-delta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-delta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-delta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-delta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-delta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-delta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-delta-size-0', 1, v_id, 'D'),
      ('ring-delta-size-1', 2, v_id, 'E'),
      ('ring-delta-size-2', 3, v_id, 'F'),
      ('ring-delta-size-3', 4, v_id, 'G'),
      ('ring-delta-size-4', 5, v_id, 'H'),
      ('ring-delta-size-5', 6, v_id, 'I'),
      ('ring-delta-size-6', 7, v_id, 'J'),
      ('ring-delta-size-7', 8, v_id, 'K'),
      ('ring-delta-size-8', 9, v_id, 'L'),
      ('ring-delta-size-9', 10, v_id, 'M'),
      ('ring-delta-size-10', 11, v_id, 'N'),
      ('ring-delta-size-11', 12, v_id, 'O'),
      ('ring-delta-size-12', 13, v_id, 'P'),
      ('ring-delta-size-13', 14, v_id, 'Q'),
      ('ring-delta-size-14', 15, v_id, 'R'),
      ('ring-delta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-delta-specs',
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
    'ring-elena',
    'Elena',
    'Elena - Oval 4 Claw Trilogy with Pear Side Stones and Tulip Detail Engagement Ring',
    'The Elena trilogy is a charming three-stone design featuring an oval cut centre stone, two pear cut side stones and a beautiful petal setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'trilogy'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-elena';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-elena-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elena-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-elena-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/elena/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/elena/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-elena-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-elena-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-elena-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-elena-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-elena-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-elena-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-elena-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-elena-size-0', 1, v_id, 'D'),
      ('ring-elena-size-1', 2, v_id, 'E'),
      ('ring-elena-size-2', 3, v_id, 'F'),
      ('ring-elena-size-3', 4, v_id, 'G'),
      ('ring-elena-size-4', 5, v_id, 'H'),
      ('ring-elena-size-5', 6, v_id, 'I'),
      ('ring-elena-size-6', 7, v_id, 'J'),
      ('ring-elena-size-7', 8, v_id, 'K'),
      ('ring-elena-size-8', 9, v_id, 'L'),
      ('ring-elena-size-9', 10, v_id, 'M'),
      ('ring-elena-size-10', 11, v_id, 'N'),
      ('ring-elena-size-11', 12, v_id, 'O'),
      ('ring-elena-size-12', 13, v_id, 'P'),
      ('ring-elena-size-13', 14, v_id, 'Q'),
      ('ring-elena-size-14', 15, v_id, 'R'),
      ('ring-elena-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-elena-specs',
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
    'ring-eliana',
    'Eliana',
    'Eliana - Emerald 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Eliana makes a statement with a striking high-set 4-claw emerald cut centre stone, wrap-around hidden halo and 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-eliana';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-eliana-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eliana-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eliana-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eliana/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eliana/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-eliana-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-eliana-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-eliana-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-eliana-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eliana-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-eliana-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-eliana-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-eliana-size-0', 1, v_id, 'D'),
      ('ring-eliana-size-1', 2, v_id, 'E'),
      ('ring-eliana-size-2', 3, v_id, 'F'),
      ('ring-eliana-size-3', 4, v_id, 'G'),
      ('ring-eliana-size-4', 5, v_id, 'H'),
      ('ring-eliana-size-5', 6, v_id, 'I'),
      ('ring-eliana-size-6', 7, v_id, 'J'),
      ('ring-eliana-size-7', 8, v_id, 'K'),
      ('ring-eliana-size-8', 9, v_id, 'L'),
      ('ring-eliana-size-9', 10, v_id, 'M'),
      ('ring-eliana-size-10', 11, v_id, 'N'),
      ('ring-eliana-size-11', 12, v_id, 'O'),
      ('ring-eliana-size-12', 13, v_id, 'P'),
      ('ring-eliana-size-13', 14, v_id, 'Q'),
      ('ring-eliana-size-14', 15, v_id, 'R'),
      ('ring-eliana-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-eliana-specs',
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

