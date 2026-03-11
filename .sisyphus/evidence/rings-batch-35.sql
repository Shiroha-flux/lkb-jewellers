DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-parker',
    'Parker',
    'Parker - Emerald 4 Claw Solitaire with Marquise and Round Accent Stones Engagement Ring',
    'Parker is a charming emerald solitaire design with four eagle-tipped claws and a unique band characterised by round and marquise cut accent stones. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-parker';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-parker-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-parker-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-parker-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/parker/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/parker/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-parker-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-parker-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-parker-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-parker-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-parker-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-parker-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-parker-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-parker-size-0', 1, v_id, 'D'),
      ('ring-parker-size-1', 2, v_id, 'E'),
      ('ring-parker-size-2', 3, v_id, 'F'),
      ('ring-parker-size-3', 4, v_id, 'G'),
      ('ring-parker-size-4', 5, v_id, 'H'),
      ('ring-parker-size-5', 6, v_id, 'I'),
      ('ring-parker-size-6', 7, v_id, 'J'),
      ('ring-parker-size-7', 8, v_id, 'K'),
      ('ring-parker-size-8', 9, v_id, 'L'),
      ('ring-parker-size-9', 10, v_id, 'M'),
      ('ring-parker-size-10', 11, v_id, 'N'),
      ('ring-parker-size-11', 12, v_id, 'O'),
      ('ring-parker-size-12', 13, v_id, 'P'),
      ('ring-parker-size-13', 14, v_id, 'Q'),
      ('ring-parker-size-14', 15, v_id, 'R'),
      ('ring-parker-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-parker-specs',
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
    'ring-penelope',
    'Penelope',
    'Penelope - Oval Claw Solitaire with Hidden Halo and Triple Pave Band Engagement Ring',
    'Penelope is a stunning oval solitaire engagement ring with four eagle-tipped claws, a sparkling hidden halo and 2/3 triple pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-penelope';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-penelope-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-penelope-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-penelope-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/penelope/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/penelope/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-penelope-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-penelope-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-penelope-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-penelope-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-penelope-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-penelope-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-penelope-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-penelope-size-0', 1, v_id, 'D'),
      ('ring-penelope-size-1', 2, v_id, 'E'),
      ('ring-penelope-size-2', 3, v_id, 'F'),
      ('ring-penelope-size-3', 4, v_id, 'G'),
      ('ring-penelope-size-4', 5, v_id, 'H'),
      ('ring-penelope-size-5', 6, v_id, 'I'),
      ('ring-penelope-size-6', 7, v_id, 'J'),
      ('ring-penelope-size-7', 8, v_id, 'K'),
      ('ring-penelope-size-8', 9, v_id, 'L'),
      ('ring-penelope-size-9', 10, v_id, 'M'),
      ('ring-penelope-size-10', 11, v_id, 'N'),
      ('ring-penelope-size-11', 12, v_id, 'O'),
      ('ring-penelope-size-12', 13, v_id, 'P'),
      ('ring-penelope-size-13', 14, v_id, 'Q'),
      ('ring-penelope-size-14', 15, v_id, 'R'),
      ('ring-penelope-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-penelope-specs',
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
    'ring-phoebe',
    'Phoebe',
    'Phoebe - Oval 4 Claw Solitaire with Halo Engagement Ring',
    'The Phoebe engagement ring features a striking oval cut centre stone framed by an exquisite halo and four eagle-tipped claws. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-phoebe';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-phoebe-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-phoebe-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-phoebe-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/phoebe/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/phoebe/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-phoebe-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-phoebe-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-phoebe-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-phoebe-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-phoebe-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-phoebe-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-phoebe-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-phoebe-size-0', 1, v_id, 'D'),
      ('ring-phoebe-size-1', 2, v_id, 'E'),
      ('ring-phoebe-size-2', 3, v_id, 'F'),
      ('ring-phoebe-size-3', 4, v_id, 'G'),
      ('ring-phoebe-size-4', 5, v_id, 'H'),
      ('ring-phoebe-size-5', 6, v_id, 'I'),
      ('ring-phoebe-size-6', 7, v_id, 'J'),
      ('ring-phoebe-size-7', 8, v_id, 'K'),
      ('ring-phoebe-size-8', 9, v_id, 'L'),
      ('ring-phoebe-size-9', 10, v_id, 'M'),
      ('ring-phoebe-size-10', 11, v_id, 'N'),
      ('ring-phoebe-size-11', 12, v_id, 'O'),
      ('ring-phoebe-size-12', 13, v_id, 'P'),
      ('ring-phoebe-size-13', 14, v_id, 'Q'),
      ('ring-phoebe-size-14', 15, v_id, 'R'),
      ('ring-phoebe-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-phoebe-specs',
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
    'ring-pia',
    'Pia',
    'Pia - Marquise 2 Claw Solitaire with Wave Band and East West Setting Engagement Ring',
    'Pia showcases a marquise cut centre stone resting within two v-claws and a uniquely curved band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-pia';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-pia-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-pia-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-pia-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/pia/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/pia/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-pia-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-pia-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-pia-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-pia-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-pia-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-pia-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-pia-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-pia-size-0', 1, v_id, 'D'),
      ('ring-pia-size-1', 2, v_id, 'E'),
      ('ring-pia-size-2', 3, v_id, 'F'),
      ('ring-pia-size-3', 4, v_id, 'G'),
      ('ring-pia-size-4', 5, v_id, 'H'),
      ('ring-pia-size-5', 6, v_id, 'I'),
      ('ring-pia-size-6', 7, v_id, 'J'),
      ('ring-pia-size-7', 8, v_id, 'K'),
      ('ring-pia-size-8', 9, v_id, 'L'),
      ('ring-pia-size-9', 10, v_id, 'M'),
      ('ring-pia-size-10', 11, v_id, 'N'),
      ('ring-pia-size-11', 12, v_id, 'O'),
      ('ring-pia-size-12', 13, v_id, 'P'),
      ('ring-pia-size-13', 14, v_id, 'Q'),
      ('ring-pia-size-14', 15, v_id, 'R'),
      ('ring-pia-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-pia-specs',
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
    'ring-polly',
    'Polly',
    'Polly - Pear 5 Claw Solitaire with Clustered Round Shoulder Stones Engagement Ring',
    'Polly features a basket-set pear-shaped centre stone, accented by a delicate cluster of brilliant round stones. The design balances soft detail with a clean, refined silhouette. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-polly';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-polly-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-polly-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-polly-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/polly/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/polly/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-polly-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-polly-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-polly-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-polly-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-polly-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-polly-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-polly-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-polly-size-0', 1, v_id, 'D'),
      ('ring-polly-size-1', 2, v_id, 'E'),
      ('ring-polly-size-2', 3, v_id, 'F'),
      ('ring-polly-size-3', 4, v_id, 'G'),
      ('ring-polly-size-4', 5, v_id, 'H'),
      ('ring-polly-size-5', 6, v_id, 'I'),
      ('ring-polly-size-6', 7, v_id, 'J'),
      ('ring-polly-size-7', 8, v_id, 'K'),
      ('ring-polly-size-8', 9, v_id, 'L'),
      ('ring-polly-size-9', 10, v_id, 'M'),
      ('ring-polly-size-10', 11, v_id, 'N'),
      ('ring-polly-size-11', 12, v_id, 'O'),
      ('ring-polly-size-12', 13, v_id, 'P'),
      ('ring-polly-size-13', 14, v_id, 'Q'),
      ('ring-polly-size-14', 15, v_id, 'R'),
      ('ring-polly-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-polly-specs',
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