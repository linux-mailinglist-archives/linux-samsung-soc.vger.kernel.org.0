Return-Path: <linux-samsung-soc+bounces-2268-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB24880BC3
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Mar 2024 08:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24D0E1F2452C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Mar 2024 07:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4629920DCD;
	Wed, 20 Mar 2024 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrhWbZkB"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59511EB25
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2024 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710918856; cv=none; b=c+Cr9lj0LnDKZGKSfBYVsJ807FEfb2GXy85/Y7Y6BRPqqfFU7yNtTK5furAeG+Kh8BH/kWQd4OTvSI7qx96NiMBWRj6SCsO45A41TNtUVinNnlkkwJ4Z5GF582/zm/t11PPECc+yfGnVtmX+Hl5y6Pk8LMowE5BXMabaLlHL+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710918856; c=relaxed/simple;
	bh=xEmFnSxCQzrHscs+HCvIbi66aDmD5SivRCMts2FMl/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAKbToTOT8hlEBZNEyd0oQoHQ2TRuCv9/Kmggs3Ddz8Q5aM791cMrXXJqeVj405tehMkuV3yoUYoZ9J6gWdnakeCFk4oq67TJ96CP7qT4c7EE2sH6MPFyf4GXj3Ziv6FoQKP+YSBAmEORLBVNohrzObN3980aL6PdgqSPoOQqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrhWbZkB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56b9e5ed074so1814601a12.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Mar 2024 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710918852; x=1711523652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg1FunL6jyj0B4tLM7JyuHaHQjdfFL1e8fU0rSTCcBw=;
        b=yrhWbZkBQqTMaLhJKaa4CFT/TA5v+2bVGpL7urxDUfNifgoOmYCZTADR/t5TAJfTxr
         YXpbkZlUd12qNWBDOY5fdD0lo9alIp9msixWqPxcM1f7BZBKN7hxySoEu+nMVT0zdinV
         X1hAdhQq77UiGEuFRpxTN5L0yOq4uLMCNi6GnP8i27uuJwF7Uz3vckrGLRVKI5suec/X
         gJJG8cqpmPx5d4aukqK1g1OOSP8ZBtTMkTZC0ucgjHrynL3FhvYwvJrN0uebwMGevOig
         Tq8VV3JxynjVZ5KdT8x+MKxe96NWeNkXBo+deB2gy61qlVU1JsDDzkREvOyWOpkFUPr/
         OQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710918852; x=1711523652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wg1FunL6jyj0B4tLM7JyuHaHQjdfFL1e8fU0rSTCcBw=;
        b=K0ApOkECSDYo890HnT/ZMOXWXbHxjIdYudSVYO1nCI2kDcvpQP4S8ufUo1ALhJDD0H
         JDywasA2M/FYyoNrzfnV6P28cmuIQdmwGM6UcRzsS2DgrWdqo5SEQIzYG3Iw3jOS3dZ7
         +FGEuCAtb3MyqqdtTL5TTrQAnEAGLVLtOJ2sEaLBByWaPLxy3AuYzdIe2M2lAOPnf1hs
         7oIK1TYb6S5/Q8goH4FrrtOkbaO2xvpBlnvQzpNIKfmkNj+uXgrIlLWEgdJpQEuF1e5F
         DEZ70VLbM1J7IuDvagUzXcgViF0eor0vMQAIAB3Jrwxtus9m9dvL+Py5SCXSNG/EeU0p
         OGmA==
X-Forwarded-Encrypted: i=1; AJvYcCWTFkEn1WdaKmYACcW//U3k8nOLdv8upcSEErlAcMIgpT4H73Gmx/BjxvotUfS2IB0oFDA4Ft3AxnHhbP/Go53icB1TF9V+GUV1BOfppFdlAUg=
X-Gm-Message-State: AOJu0YzL6/fMPWZSqFUTKFpBTgvVsF2XYNNF1tgyRfUF+H1ZQnBN0rUd
	jXLjG+Xn2LroxzoJEoOqwySlvWhP42XDTN44er9Y5WhJr+bTzcyDhDBsj+DE+u8=
X-Google-Smtp-Source: AGHT+IF9gmDahEPShyP+huxWDon36DeJZWflQoKA2dVvNe9Fz8Bf9q3I+ZfZXbfU2hFsKx9u3Yj14Q==
X-Received: by 2002:a17:906:4a84:b0:a45:27bd:e1ff with SMTP id x4-20020a1709064a8400b00a4527bde1ffmr706874eju.6.1710918852030;
        Wed, 20 Mar 2024 00:14:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id hg25-20020a1709072cd900b00a469be48551sm5228432ejc.45.2024.03.20.00.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 00:14:11 -0700 (PDT)
Message-ID: <5976952b-d5e8-4333-b769-d494b8195689@linaro.org>
Date: Wed, 20 Mar 2024 08:14:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: reset: add gs101 poweroff
 bindings
To: Alexey Klimov <alexey.klimov@linaro.org>, sre@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 peter.griffin@linaro.org, robh+dt@kernel.org
Cc: conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 semen.protsenko@linaro.org, linux-kernel@vger.kernel.org,
 klimov.linux@gmail.com, kernel-team@android.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 elder@linaro.org
References: <20240320020549.71810-1-alexey.klimov@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240320020549.71810-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2024 03:05, Alexey Klimov wrote:
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Missing commit msg.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
>  .../power/reset/google,gs101-poweroff.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml
> new file mode 100644
> index 000000000000..d704bf28294a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/google,gs101-poweroff.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/google,gs101-poweroff.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 poweroff driver

Bindings are not for drivers, but hardware.

> +
> +maintainers:
> +  - Alexey Klimov <alexey.klimov@linaro.org>
> +
> +description: |+
> +  This is a Google Tensor gs101 poweroff driver using custom regmap

Bindings are not for drivers, but hardware.

> +  to map the poweroff register. The poweroff itself is performed with
> +  a write to the poweroff register from a privileged mode. Since generic
> +  syscon does not support this, the specific one is required.
> +  The write to the poweroff register is defined by the register map pointed
> +  by syscon reference plus the offset with the value and mask defined
> +  in the poweroff node.
> +  Default will be little endian mode, 32 bit access only.
> +
> +properties:
> +  compatible:
> +    const: google,gs101-poweroff
> +
> +  mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Update only the register bits defined by the mask (32 bit).
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the poweroff register (in bytes).
> +
> +  samsung,syscon-phandle:
> +    $ref: /schemas/types.yaml#/definitions/phandle

This does not look right. The poweroff handling is within PMU, not
somewhere else. Don't use syscons as a replacement of regular MMIO
addresses.



Best regards,
Krzysztof


