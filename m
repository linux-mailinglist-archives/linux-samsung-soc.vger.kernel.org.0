Return-Path: <linux-samsung-soc+bounces-1847-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6D84E24E
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Feb 2024 14:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16ED1F2625E
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Feb 2024 13:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADF677F0E;
	Thu,  8 Feb 2024 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFtzZU7F"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEF768E9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400256; cv=none; b=AY/PLCNe2hxBb5HHHCK9xgr0HGqxw4sm8jFhWgPDIL0Mg1Js/RRafbnEtu+lzITj1JLG2Xn5RtMeLAit17Mlh0lGH6ECh84A6sN16I+zZiapZiHIfCEaJCFLXbMriLdSytnWtv8v9tZB/Jrkqkuni1PL7UMgVATJaT45B39AHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400256; c=relaxed/simple;
	bh=rkU81zi0IpYhhc5gOUB/YrsotltKHmP2oeD/quouCyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbahCQAk/3Y2jQwN1VehxvibMbwsc1tyRN1mnUBnH+ldw8EOl1q8D2ZoTa1qYnFR/MqTwc13upYHu9/r9E2eRHxlAEFsEUTDcQmCmiqA0Y64p8PzDHV6TLBft6hmpIdhQjuKwM2+oILUgs2Mp5dVkmobEv3iFHVvXWwL0HjJwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFtzZU7F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33aeb088324so1286398f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400253; x=1708005053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezIckqSjaHOJly+ofLnXueELrOHkQXapSLYglkjVtiI=;
        b=LFtzZU7F9m4Z/POSlfDcxhPT+d9urSlOb+okSHqn4i1lAooje9RiGkzz+U4K3T635i
         mTfZM5B/HGr7YEvBNxHRheEmyuGl0YAK4yTa2/T9MFiYbZ4I/Kr8rmiIJhVo85ImHOll
         AvH1dp95/38LQ7O8R74bXH1O5xVqef64seyQi7ow2U+B8WEesFlGBxLf47Pzr9A+c6mt
         bamejG5bKrsZ2HYxdETcRtUe5Vu2D/FbzbC/I16LXzR4EcDxf0TJp+ng4vRN3Fxg5VFK
         Fn5slJMmmq8ljTN5lgLiMZtI7Jl8DF5wEZXQgGzAlC0vvtuoR6vi5+hwELNBdPflkSmo
         iPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400253; x=1708005053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezIckqSjaHOJly+ofLnXueELrOHkQXapSLYglkjVtiI=;
        b=CM+qe4HR+2/3lIYVgCetUyAgiHGlHpKtZjuUZpo8NHzrhjq/LrdAyIKZwlreHpsJya
         ozMlRbQ00uTXzfHbCZVL2o5CNsWTDrmduwffxGxP0d1ybtzGmiOGvgzKuOppkXSzyLwn
         lvEZjwlBMNopH8tGt/FZmXzHjXZ0laeEcgUz4YMla8jQZhyjeViRKIKecao9dBy6wjYD
         bouVQknzQsi94TQ7Ewmje+BXxC91ER0GxCfESn1hKnkBJVaFxJAEN762byZw+BpYrPgD
         hb4o3b9oZ9CCQe/tltMjvI1vbEDzV7V/Zh0DK9JlvSjT14DcER9C2/xyPeuDoPq6enKI
         eo+Q==
X-Gm-Message-State: AOJu0YzBYynJoa3XEriKy8n3OPALIAq5/ikV1y7lJsWI9tGNC7qGcRU6
	1C5iCCDe/SUJ1dZPpslnbGzMILBRy2Cqxg0tcgxS2+4t7WoE6tOZ+MtaZjCzXIc=
X-Google-Smtp-Source: AGHT+IHzTtRxu7JH2TlR7R5xySYChv9QNwLinyCxGoft1hqELdQlULHFUPWhMHqOWJvibWIos/yV1w==
X-Received: by 2002:a05:6000:1208:b0:33b:3ceb:99cf with SMTP id e8-20020a056000120800b0033b3ceb99cfmr5543737wrx.67.1707400252929;
        Thu, 08 Feb 2024 05:50:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe+IA8lClHorFvbt+R7LYrtzl9JaTfah+IU2ztSQn2l67Okgaei3aZz4l8mQjnMAtX65LLUAuq8KW9RX6Xejg3SPycB7enkRe/JD4vuAn2TWGDR3OkAkhhA6sRJEL6DwLNi4bPyCsEw8KS35tAj4AoO23/RhqfO0hHVn6BtuwrWbtQarWlEBAXjxSyBRkRJtK6drm7xDeJqVbvghCVRDFnSVAwr8P9W1UevPnA/Q9uEKdvfdIo3awYkoDvyWIsVuWV/Sz8ELSzlPWZ1/ebQof/VC4yCEWVjOM6edN+zz2C31ItxIlhiTk+7zfkvfrRBckeQTH7BmHhOy7vfI8NUO5NoUI8+NxVrRzmbvUnQLxGcMjHn47EqK7KwS5w/xS5xCUoruB98DC17flAcA/9ykOzp2V3sH8vI3Rgp66FWjG5gUo1i3C0JaXSueYB/ZTrKtw07bjVaLDqaf8B1Psm5/0h89ZiSLkOe60LnwaGK4O/m7/DxtJcwYqOF2RjL3ehs2LBvTXU7v5aKH3uv1kr1rMIW25K/nNRqW+D+a0A2rBwBuNC5axZAmCLgjO0Q6cRcsVC/2p0aZJtHWDq0k+R/YMFrKombP0nST5YR2EjSg==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0033b43a5f53csm3618820wrh.103.2024.02.08.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:50:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 00/12] spi: s3c64xx: remove OF alias ID dependency
Date: Thu,  8 Feb 2024 13:50:33 +0000
Message-ID: <20240208135045.3728927-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver was wrong as it assumed that the alias values in devicetree
have a particular meaning in identifying instances. This immediately
breaks when there is a dtb file that does not use the same alias values,
e.g. because it only needs some of the SPI ports.

Tested gs101 SPI with spi-loopback-test, all went fine. I updated
exynos850 as it uses the same USI.SPI_VERSION as gs101. Maybe Sam can
test exynos850, if not, we can drop that patch.

The patch set has some dependencies. One has to apply first the gs101
addition [1], then the simple cleanup from [2], then this patch set.
[1] https://lore.kernel.org/linux-spi/20240207111516.2563218-1-tudor.ambarus@linaro.org/
[2] https://lore.kernel.org/linux-spi/20240207120431.2766269-1-tudor.ambarus@linaro.org/

Cheers,
ta

Tudor Ambarus (12):
  spi: dt-bindings: introduce the ``fifo-depth`` property
  spi: s3c64xx: define a magic value
  spi: s3c64xx: allow full FIFO masks
  spi: s3c64xx: determine the fifo depth only once
  spi: s3c64xx: retrieve the FIFO depth from the device tree
  spi: s3c64xx: allow FIFO depth to be determined from the compatible
  spi: s3c64xx: let the SPI core determine the bus number
  spi: s3c64xx: introduce s3c64xx_spi_set_port_id()
  spi: s3c64xx: get rid of the OF alias ID dependency
  spi: s3c64xx: deprecate fifo_lvl_mask, rx_lvl_offset and port_id
  spi: s3c64xx: switch gs101 to new port config data
  spi: s3c64xx: switch exynos850 to new port config data

 .../bindings/spi/spi-controller.yaml          |   5 +
 drivers/spi/spi-s3c64xx.c                     | 142 ++++++++++++++----
 2 files changed, 116 insertions(+), 31 deletions(-)

-- 
2.43.0.687.g38aa6559b0-goog


