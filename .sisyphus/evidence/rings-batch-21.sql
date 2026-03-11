DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-giselle',
    'Giselle',
    'Giselle - Marquise 4 Claw Solitaire with V Band Engagement Ring',
    'With four eagle-tipped claws and a sharp V point, Giselle is a sleek design featuring an exquisite marquise cut centre stone. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-giselle';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-giselle-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-giselle-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-giselle-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/giselle/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/giselle/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-giselle-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-giselle-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-giselle-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-giselle-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-giselle-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-giselle-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-giselle-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-giselle-size-0', 1, v_id, 'D'),
      ('ring-giselle-size-1', 2, v_id, 'E'),
      ('ring-giselle-size-2', 3, v_id, 'F'),
      ('ring-giselle-size-3', 4, v_id, 'G'),
      ('ring-giselle-size-4', 5, v_id, 'H'),
      ('ring-giselle-size-5', 6, v_id, 'I'),
      ('ring-giselle-size-6', 7, v_id, 'J'),
      ('ring-giselle-size-7', 8, v_id, 'K'),
      ('ring-giselle-size-8', 9, v_id, 'L'),
      ('ring-giselle-size-9', 10, v_id, 'M'),
      ('ring-giselle-size-10', 11, v_id, 'N'),
      ('ring-giselle-size-11', 12, v_id, 'O'),
      ('ring-giselle-size-12', 13, v_id, 'P'),
      ('ring-giselle-size-13', 14, v_id, 'Q'),
      ('ring-giselle-size-14', 15, v_id, 'R'),
      ('ring-giselle-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-giselle-specs',
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
    'ring-glinda',
    'Glinda',
    'Glinda - Princess 4 Claw Solitaire Engagement Ring',
    'Glinda is a striking solitaire engagement ring with an elegant princess cut centre stone, thick basket setting and four sleek square claws. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'princess'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-glinda';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-glinda-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-glinda-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-glinda-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/glinda/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/glinda/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-glinda-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-glinda-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-glinda-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-glinda-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-glinda-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-glinda-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-glinda-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-glinda-size-0', 1, v_id, 'D'),
      ('ring-glinda-size-1', 2, v_id, 'E'),
      ('ring-glinda-size-2', 3, v_id, 'F'),
      ('ring-glinda-size-3', 4, v_id, 'G'),
      ('ring-glinda-size-4', 5, v_id, 'H'),
      ('ring-glinda-size-5', 6, v_id, 'I'),
      ('ring-glinda-size-6', 7, v_id, 'J'),
      ('ring-glinda-size-7', 8, v_id, 'K'),
      ('ring-glinda-size-8', 9, v_id, 'L'),
      ('ring-glinda-size-9', 10, v_id, 'M'),
      ('ring-glinda-size-10', 11, v_id, 'N'),
      ('ring-glinda-size-11', 12, v_id, 'O'),
      ('ring-glinda-size-12', 13, v_id, 'P'),
      ('ring-glinda-size-13', 14, v_id, 'Q'),
      ('ring-glinda-size-14', 15, v_id, 'R'),
      ('ring-glinda-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-glinda-specs',
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
    'ring-grace',
    'Grace',
    'Grace - Oval 4 Claw Trilogy with Round Side Stones, Open Trellis Gallery and Tapered Band Engagement Ring',
    'Grace is a timeless trilogy design featuring a stunning oval cut centre stone and two round cut side stones placed within a trellis setting and tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-grace';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-grace-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-grace-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-grace-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/grace/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/grace/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-grace-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-grace-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-grace-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-grace-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-grace-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-grace-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-grace-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-grace-size-0', 1, v_id, 'D'),
      ('ring-grace-size-1', 2, v_id, 'E'),
      ('ring-grace-size-2', 3, v_id, 'F'),
      ('ring-grace-size-3', 4, v_id, 'G'),
      ('ring-grace-size-4', 5, v_id, 'H'),
      ('ring-grace-size-5', 6, v_id, 'I'),
      ('ring-grace-size-6', 7, v_id, 'J'),
      ('ring-grace-size-7', 8, v_id, 'K'),
      ('ring-grace-size-8', 9, v_id, 'L'),
      ('ring-grace-size-9', 10, v_id, 'M'),
      ('ring-grace-size-10', 11, v_id, 'N'),
      ('ring-grace-size-11', 12, v_id, 'O'),
      ('ring-grace-size-12', 13, v_id, 'P'),
      ('ring-grace-size-13', 14, v_id, 'Q'),
      ('ring-grace-size-14', 15, v_id, 'R'),
      ('ring-grace-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-grace-specs',
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
    'ring-greta',
    'Greta',
    'Greta - Round 4 Claw Solitaire with Round Shoulder Stones Engagement Ring',
    'Sweet and feminine, Greta is a classic round solitaire design accentuated by round cut accent stones and seated in a gorgeous trilogy basket setting atop a tapered band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-greta';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-greta-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-greta-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-greta-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/greta/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/greta/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-greta-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-greta-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-greta-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-greta-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-greta-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-greta-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-greta-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-greta-size-0', 1, v_id, 'D'),
      ('ring-greta-size-1', 2, v_id, 'E'),
      ('ring-greta-size-2', 3, v_id, 'F'),
      ('ring-greta-size-3', 4, v_id, 'G'),
      ('ring-greta-size-4', 5, v_id, 'H'),
      ('ring-greta-size-5', 6, v_id, 'I'),
      ('ring-greta-size-6', 7, v_id, 'J'),
      ('ring-greta-size-7', 8, v_id, 'K'),
      ('ring-greta-size-8', 9, v_id, 'L'),
      ('ring-greta-size-9', 10, v_id, 'M'),
      ('ring-greta-size-10', 11, v_id, 'N'),
      ('ring-greta-size-11', 12, v_id, 'O'),
      ('ring-greta-size-12', 13, v_id, 'P'),
      ('ring-greta-size-13', 14, v_id, 'Q'),
      ('ring-greta-size-14', 15, v_id, 'R'),
      ('ring-greta-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-greta-specs',
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
    'ring-gwyneth',
    'Gwyneth',
    'Gwyneth - Emerald 4 Claw Solitaire with Hidden Halo and Pave Band Engagement Ring',
    'With a stunning emerald cut centre stone held by a 4-claw setting, Gwyneth is completed by a sparkling hidden halo &amp;amp; 2/3 pavé band. Schedule an appointment with Cullen US today.',
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
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-gwyneth';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-gwyneth-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gwyneth-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-gwyneth-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/gwyneth/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/gwyneth/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-gwyneth-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-gwyneth-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-gwyneth-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-gwyneth-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-gwyneth-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-gwyneth-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-gwyneth-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-gwyneth-size-0', 1, v_id, 'D'),
      ('ring-gwyneth-size-1', 2, v_id, 'E'),
      ('ring-gwyneth-size-2', 3, v_id, 'F'),
      ('ring-gwyneth-size-3', 4, v_id, 'G'),
      ('ring-gwyneth-size-4', 5, v_id, 'H'),
      ('ring-gwyneth-size-5', 6, v_id, 'I'),
      ('ring-gwyneth-size-6', 7, v_id, 'J'),
      ('ring-gwyneth-size-7', 8, v_id, 'K'),
      ('ring-gwyneth-size-8', 9, v_id, 'L'),
      ('ring-gwyneth-size-9', 10, v_id, 'M'),
      ('ring-gwyneth-size-10', 11, v_id, 'N'),
      ('ring-gwyneth-size-11', 12, v_id, 'O'),
      ('ring-gwyneth-size-12', 13, v_id, 'P'),
      ('ring-gwyneth-size-13', 14, v_id, 'Q'),
      ('ring-gwyneth-size-14', 15, v_id, 'R'),
      ('ring-gwyneth-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-gwyneth-specs',
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