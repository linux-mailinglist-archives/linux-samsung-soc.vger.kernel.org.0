Return-Path: <linux-samsung-soc+bounces-543-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670880C200
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 08:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FD78B20924
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 07:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBCC2030B;
	Mon, 11 Dec 2023 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BLCdW7ef"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DFDEB
	for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:36:25 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-336223afe64so434660f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Dec 2023 23:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702280183; x=1702884983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YHBWFSpjhw0+JPItFiuftFwl12od6x19Q3Kp1H3E6I=;
        b=BLCdW7efF2tjpduz+TWYaE9woLpNDYKcrX2wH+l9JJAYZ/rdYKH2CPjyRTJl6TYke/
         eM7OwIYX7IVqwmND0ZRtX8cBrvrVaBcv5h41sto8GK/d5UfLXLmc3qt5EiUf+bd550jm
         DVT/DpRY+IJRagODb2tGkGJSWqHTx731HO+KmJERi+aebPqiaEOAUOyFuWunzVrZJeCb
         YdwxJBWfW8lqcNqSr3LkPQCU297oQSFteHAByRHCdQe41TetOBSTrWNJCBIPqjmnh04D
         v7tL/J0yE8sCu2kUzCjr/GQtHSXIlfigyY61o71goOldx8JaH+kIsTViHDY3V3nEINcV
         mBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702280183; x=1702884983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YHBWFSpjhw0+JPItFiuftFwl12od6x19Q3Kp1H3E6I=;
        b=UF9wjCHO10yq0YbovQTfukHUxgLULpgE8LrSjm7jT0dda3Y9RmdFcfiWdhGhrXsh3k
         0tmwDfOIriyDnsyYe3FIasteyTO55dkfmzKpfJ2hnHPGWHyqZLNXpNNEFpxckuT9DdXL
         MfLDcJYKjpvNN++KBETNX+fonhqX+9vZabolmqOCElIszt6f0F7NVx8v2UlHclFE1ux8
         s/dnmMuutzMU9+I2Ofc7mecSHIvTOGYr7Q5kbdv58AQF9aVrY6lFi0NRLCX9zxTGTQi9
         sUafbSIQ4LagfEo0CUb0440NGN0020xg8v6b0xTT5VU42Ooz1sP/+/b7iqunqCYYf134
         JTVg==
X-Gm-Message-State: AOJu0Yx12EV1ZvW1xSbupPUe+O3hleQmY3VR50CnBcmJk8SM7neg+HTz
	uJ1lOBm9Z+/yj3c8Rj2Nm10yWA==
X-Google-Smtp-Source: AGHT+IHK1+dJ3/6VbSmAjUHE3obgzLfsu3H2LPctpshzkB4sycS+dJ6werIvZjF7MuQxeZLkp64tiw==
X-Received: by 2002:a05:600c:2289:b0:40c:317b:79f0 with SMTP id 9-20020a05600c228900b0040c317b79f0mr2120989wmf.140.1702280183340;
        Sun, 10 Dec 2023 23:36:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c45ca00b0040c3dcc36e6sm7700311wmo.47.2023.12.10.23.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 23:36:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaewon Kim <jaewon02.kim@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
References: <20231210133915.42112-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: correct ExynosAutov920
 wake-up compatibles
Message-Id: <170228018218.6375.7978493220422861783.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 08:36:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sun, 10 Dec 2023 14:39:15 +0100, Krzysztof Kozlowski wrote:
> ExynosAutov920 SoC wake-up pin controller has different register layout
> than Exynos7, thus it should not be marked as compatible.  Neither DTS
> nor Linux driver was merged yet, so the change does not impact ABI.
> 
> 

Applied, thanks!

[1/1] dt-bindings: pinctrl: samsung: correct ExynosAutov920 wake-up compatibles
      https://git.kernel.org/pinctrl/samsung/c/e1564d6f93496bcea3a6b2110eb54cc08f2aca72

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


