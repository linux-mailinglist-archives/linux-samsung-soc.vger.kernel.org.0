Return-Path: <linux-samsung-soc+bounces-9595-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F059B16F5B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Jul 2025 12:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457EB621930
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Jul 2025 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668E72BDC3E;
	Thu, 31 Jul 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdtIclw1"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F22BD595
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2025 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957262; cv=none; b=dEwZsERNsDJLL51pgmoEhTMCg991HKOex5Bm57JooBNxe0IH2A2TlCWVGIQfJlwlOI3iJHgazu0EXgR931dUA9xjl+LvNjiLrYa3YRoeX6nJerbHz+gos9Az3/co/+LTCu0pvj5wnXOQ1h4ZjbbQwkxG/m6zz8HlalpcFIJ4atY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957262; c=relaxed/simple;
	bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BdULhwTO5wy3Bnco0VKbd2rnCYpcz/qsF2ln2VQAULCOvjNZM+prk3zPXHYyRy3qa3qUjRziApnvCMIMQnR5u3KG02eUEcYR6w6umCPUZ+DFuhmSa3RbsrY7BF/iHFX+XfMOF/7kwWeLEaRDfbeX4RcdeDvRjhVpXR1TanYTbiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdtIclw1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso1108229f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2025 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753957259; x=1754562059; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=DdtIclw12SBilY5CAMUdd7ccs+qeIRvc729/Y/7UPBM7zvnOIkCTQa+PU+3MJJUsN9
         dG4R06mRsp1hbfYxL0kgmbOvYyVuNrNNosd+NSNRlaAT6OSliYUNJpvgFcnT1TOVWyt+
         8c7bL1pH+7uBj8YRe0k7lF/fsw8je13pwwN+jhYH1k+D1kuA/QwxHF9165P6WVWnYkpf
         hbRbRzV0eQiXOwOqcY8rEACSBKl2hBMWHJbBi0jH9aqO+Mu2UcuadTpkzcbfLpLlyNi4
         0i7yimw64ONL2CPFVzcT9ic3bY7oTJBjqUot7A2wNJVQ49S8+MMJ7NBSgzO7czvp7MsG
         YM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957259; x=1754562059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=np+cRE6Fl8146wAk+WQ2YAqkHheYjpb63oikAAuO/TW2zSiWjuIJp9qnKSQpPDBB/G
         CQXmEMUG2XVxbyO5do81w4Kv6K47k1UHLV75cnzN/x6mARewGGN2w8rJpfc+7ltNTWHY
         9dHELUd43tFBT200NeqXQIUQPhnGK0WJoSIaZlJieYUiZoeIXXD5+1q0DZ0d8WZFPnSm
         gP8cwQSe3FFbyPMyvL0sLXzcQW8KQctXvdY0dizXR54RmxuvrYjq1dloV74ScsVoGg4K
         OEvOzrwaFiukDuNVOu73fVO0e6bjfB3NpUUp/zGrCCf5AsEL032w8vnkacSIiWz9I3Ug
         RyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXTrhIfcMFXWLf8DvyJ/qFMS/YPMD8dc9QnZnEcLca2J8qr02Oi/w9zMDBns0p9Iqt36Cl3Xv/Mx1VY1YzPYiOqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKZRFgBX8+R5MCdtZMijfsH0Fo7gUsD8gxTDOElnGVKpRMtyd
	QJ240LSRShRKOgPN0vWdchd37GU0XqoF75Y1Xeu+x1gVPcsseOx1EPw12B2j3iRL/hs=
X-Gm-Gg: ASbGnctIzs0jiHmhnvpXBaT/HSv9KX+u2WCK/fP1ONehrdMUlaFxA9t2SHPF6zIdGCF
	8Zy9KVNNW+qaRQ1jr/I2dLVWyEGhSCnQb2qQB3RIYbOWRL1jgnVV4CeRrufse5uWFU9jozH1VHA
	vgl9H3XPG9/N6hiKNwrVexm7BQZCu/LkUgJp4z1TtGHAw9w2wZvfdeBjUjXCGXMQpe1LbfG4Dk7
	V6U+azKZ7RuumsacxtoZMhwyCRS14Jw8XOCk1LGQ3zyYOwF9utzVay1+SsE7nCI6lL8IZ+FPJq9
	V5IwDaJabqFP2J62oRAOvyAxY3lvLXbhDHMijidr98wSBKNAxUjw188jiY/cxAH0V5JEJA/0Yo9
	xXDSKeBQc+qlHUaz9Sjkbj3cJ/A==
X-Google-Smtp-Source: AGHT+IFVEwLIcO4fNKnjyIY1mnWetXH6kHJKTnn/c6Wln21XoHb709OPThVEb0OesSZIKjx5gzja4Q==
X-Received: by 2002:a05:6000:22c8:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3b79d812bc8mr1195293f8f.25.1753957258867;
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588d89c50fsm60787795e9.0.2025.07.31.03.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Message-ID: <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni	 <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>,  Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 31 Jul 2025 11:20:56 +0100
In-Reply-To: <20250730145100.GA6782@google.com>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
	 <20250730145100.GA6782@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Original cover letter further down.
> >=20
> > This is a resend of two patches from the original series that haven't
> > been merged yet. That series was merged except for the attached two
> > patches here. Other than rebasing against next-20250729 there are no
> > changes to them.
> >=20
> > Lee, I think Stephen's intention was to get these two merged via the
> > MFD tree please.
>=20
> Although I have no issue with this, it does seem a little odd now that
> the set consists of only Clk patches.=C2=A0 Let me know what you / Stephe=
n
> decide.

Thanks Lee.

I simply went by Stephen's ACK, which to me implies he wanted it merged
via a different tree (mfd). I guess at this stage it doesn't matter anymore=
,
since all the core changes are in already.

I'll defer to Stephen :-)


Cheers,
Andre'


