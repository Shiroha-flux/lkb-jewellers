DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-svea',
    'Svea',
    'Svea - Pear and Princess Claw Toi et Moi Engagement Ring',
    'Svea is a breathtaking toi et moi engagement ring featuring pear and princess cut centre stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-svea';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-svea-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-svea-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-svea-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/svea/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/svea/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-svea-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-svea-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-svea-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-svea-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-svea-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-svea-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-svea-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-svea-size-0', 1, v_id, 'D'),
      ('ring-svea-size-1', 2, v_id, 'E'),
      ('ring-svea-size-2', 3, v_id, 'F'),
      ('ring-svea-size-3', 4, v_id, 'G'),
      ('ring-svea-size-4', 5, v_id, 'H'),
      ('ring-svea-size-5', 6, v_id, 'I'),
      ('ring-svea-size-6', 7, v_id, 'J'),
      ('ring-svea-size-7', 8, v_id, 'K'),
      ('ring-svea-size-8', 9, v_id, 'L'),
      ('ring-svea-size-9', 10, v_id, 'M'),
      ('ring-svea-size-10', 11, v_id, 'N'),
      ('ring-svea-size-11', 12, v_id, 'O'),
      ('ring-svea-size-12', 13, v_id, 'P'),
      ('ring-svea-size-13', 14, v_id, 'Q'),
      ('ring-svea-size-14', 15, v_id, 'R'),
      ('ring-svea-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-svea-specs',
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
    'ring-tahlia',
    'Tahlia',
    'Tahlia - Emerald and Pear Claw Toi et Moi with Hidden Halo Engagement Ring',
    'Tahlia is a classic toi et moi engagement ring with a high-set duo of pear and emerald cut stones and matching hidden halos. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tahlia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tahlia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tahlia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tahlia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tahlia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tahlia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tahlia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tahlia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tahlia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tahlia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tahlia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tahlia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tahlia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tahlia-size-0', 1, v_id, 'D'),
      ('ring-tahlia-size-1', 2, v_id, 'E'),
      ('ring-tahlia-size-2', 3, v_id, 'F'),
      ('ring-tahlia-size-3', 4, v_id, 'G'),
      ('ring-tahlia-size-4', 5, v_id, 'H'),
      ('ring-tahlia-size-5', 6, v_id, 'I'),
      ('ring-tahlia-size-6', 7, v_id, 'J'),
      ('ring-tahlia-size-7', 8, v_id, 'K'),
      ('ring-tahlia-size-8', 9, v_id, 'L'),
      ('ring-tahlia-size-9', 10, v_id, 'M'),
      ('ring-tahlia-size-10', 11, v_id, 'N'),
      ('ring-tahlia-size-11', 12, v_id, 'O'),
      ('ring-tahlia-size-12', 13, v_id, 'P'),
      ('ring-tahlia-size-13', 14, v_id, 'Q'),
      ('ring-tahlia-size-14', 15, v_id, 'R'),
      ('ring-tahlia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tahlia-specs',
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
    'ring-tanya',
    'Tanya',
    'Tanya - Oval and Emerald Claw Toi et Moi Engagement Ring',
    'Tanya is a timeless toi et moi design featuring oval cut and emerald cut centre stones, each held by four eagle-tipped claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'toi_et_moi'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tanya';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tanya-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tanya-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tanya-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tanya/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tanya/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tanya-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tanya-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tanya-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tanya-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tanya-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tanya-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tanya-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tanya-size-0', 1, v_id, 'D'),
      ('ring-tanya-size-1', 2, v_id, 'E'),
      ('ring-tanya-size-2', 3, v_id, 'F'),
      ('ring-tanya-size-3', 4, v_id, 'G'),
      ('ring-tanya-size-4', 5, v_id, 'H'),
      ('ring-tanya-size-5', 6, v_id, 'I'),
      ('ring-tanya-size-6', 7, v_id, 'J'),
      ('ring-tanya-size-7', 8, v_id, 'K'),
      ('ring-tanya-size-8', 9, v_id, 'L'),
      ('ring-tanya-size-9', 10, v_id, 'M'),
      ('ring-tanya-size-10', 11, v_id, 'N'),
      ('ring-tanya-size-11', 12, v_id, 'O'),
      ('ring-tanya-size-12', 13, v_id, 'P'),
      ('ring-tanya-size-13', 14, v_id, 'Q'),
      ('ring-tanya-size-14', 15, v_id, 'R'),
      ('ring-tanya-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tanya-specs',
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
    'ring-taylor',
    'Taylor',
    'Taylor - Vintage Style Elongated Cushion Claw Solitaire with Bezel Frame and Star Set Accent Stones and Milgrain Engagement Ring',
    'Taylor pairs an elongated cushion-cut centre stone with a bezel frame and four claws. Star-set side stones accent the shoulders, while a tapered band with milgrain detailing defines a refined, vintage-inspired design. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'bezel'::enum_ring_setting_style,
    'accents'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-taylor';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-taylor-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-taylor-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-taylor-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/taylor/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/taylor/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-taylor-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-taylor-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-taylor-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-taylor-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-taylor-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-taylor-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-taylor-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-taylor-size-0', 1, v_id, 'D'),
      ('ring-taylor-size-1', 2, v_id, 'E'),
      ('ring-taylor-size-2', 3, v_id, 'F'),
      ('ring-taylor-size-3', 4, v_id, 'G'),
      ('ring-taylor-size-4', 5, v_id, 'H'),
      ('ring-taylor-size-5', 6, v_id, 'I'),
      ('ring-taylor-size-6', 7, v_id, 'J'),
      ('ring-taylor-size-7', 8, v_id, 'K'),
      ('ring-taylor-size-8', 9, v_id, 'L'),
      ('ring-taylor-size-9', 10, v_id, 'M'),
      ('ring-taylor-size-10', 11, v_id, 'N'),
      ('ring-taylor-size-11', 12, v_id, 'O'),
      ('ring-taylor-size-12', 13, v_id, 'P'),
      ('ring-taylor-size-13', 14, v_id, 'Q'),
      ('ring-taylor-size-14', 15, v_id, 'R'),
      ('ring-taylor-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-taylor-specs',
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
    'ring-tessa',
    'Tessa',
    'Tessa - Round 6 Claw Solitaire with Petal Gallery and Tapered Band Engagement Ring',
    'The beautiful Tessa engagement ring features a round cut centre stone held in a charming 6-claw tulip-style setting atop a slim tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-tessa';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-tessa-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tessa-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-tessa-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/tessa/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/tessa/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-tessa-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-tessa-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-tessa-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-tessa-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-tessa-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-tessa-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-tessa-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-tessa-size-0', 1, v_id, 'D'),
      ('ring-tessa-size-1', 2, v_id, 'E'),
      ('ring-tessa-size-2', 3, v_id, 'F'),
      ('ring-tessa-size-3', 4, v_id, 'G'),
      ('ring-tessa-size-4', 5, v_id, 'H'),
      ('ring-tessa-size-5', 6, v_id, 'I'),
      ('ring-tessa-size-6', 7, v_id, 'J'),
      ('ring-tessa-size-7', 8, v_id, 'K'),
      ('ring-tessa-size-8', 9, v_id, 'L'),
      ('ring-tessa-size-9', 10, v_id, 'M'),
      ('ring-tessa-size-10', 11, v_id, 'N'),
      ('ring-tessa-size-11', 12, v_id, 'O'),
      ('ring-tessa-size-12', 13, v_id, 'P'),
      ('ring-tessa-size-13', 14, v_id, 'Q'),
      ('ring-tessa-size-14', 15, v_id, 'R'),
      ('ring-tessa-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-tessa-specs',
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