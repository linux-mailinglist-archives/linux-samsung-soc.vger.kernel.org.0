Return-Path: <linux-samsung-soc+bounces-592-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641FB80D1FC
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 17:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949A21C210A6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 16:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2C01F16B;
	Mon, 11 Dec 2023 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqnSl9xk"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7424BB4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:36:19 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so33047445e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702312578; x=1702917378; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=oqnSl9xk2RTxEzD6yma+xPajtnZb4XBh3BBnBDKAKEPUAM2omQ7B1U9RCKM5K+duWl
         UM7GY0xkGuUFhfqq6TDZF9Wd/vPPLm7fJyGi6DMulMyxoYe4ewT9toCLqRirkW8/CpJD
         0rWsm57VT/Q7jYcVEnuGfA/8w+bUf9NHJ3mfAwp/I9BP4yIbFx1wKbqgc1WbIPiP4IRz
         2cnJB+gi8rP6rDaxZFeXnwYfgSJT6Bqh/hDig0vjxnoFJxvo03142EP4R+NSCoWWpc3X
         9u+WICBhxruqK/9ZGVCkw0qGkSxQ0hH7rZTpkYQX+ZKgk8n07ftc6Y3aZ4yG6qF2Qmcd
         FG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312578; x=1702917378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK1lX1hwHqRE0qWwNG1aUzZucX1tBAoUd44IP9gaN34=;
        b=u3G0ZJ1tzRRTpuDU00ooO3FQEAFXIXFY2SbsRXBiDF7j4weghEMU+IPtUSwTBKuh+b
         U0wfsoQBrAxTZobr45EYxtU5Gzd/lt49cvhGKXY9HrM6rYcZsgsq9I2JKQPNHeT8Y3r/
         JvuXio5ga3RDR/iVfbUeUW8OjAGEzv5C3FSqh2uY+MQivYTNcDvom/0AuZK2JFbAXQnq
         5bEic9sN/ExYpGBfvLxNdUOiWepxLGs/8bex2I15Qm2AJF4rKAOQ1ds7FIIYeS9NvZ2x
         8IRYUXnwPRONvXvDcdSh+klPKiEHVmvaIKOmqyBinNmNQ408vksp3axod+Y9RR9Ug1cU
         J/Xg==
X-Gm-Message-State: AOJu0Yxom6kbjpJpsX1yC3qiVlm3NcGI0huQiHbbPix1blZC1KP9m72u
	v7HRk3VwzMMLhIluLUx4Rl1v9w==
X-Google-Smtp-Source: AGHT+IHqlghak/z1rUpsIZnKDYLf/Lji2enrhgj53Kac2omQn554ooTGIUHbzfez0RtduglMO9UMiw==
X-Received: by 2002:a05:600c:510e:b0:40c:67a:b3bc with SMTP id o14-20020a05600c510e00b0040c067ab3bcmr2342567wms.71.1702312577700;
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b0040c41846919sm7404061wmo.41.2023.12.11.08.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:36:17 -0800 (PST)
Message-ID: <f3299aaf9392aaedf8cca1c4756605b11c59b98f.camel@linaro.org>
Subject: Re: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix
 incorrect numbering and DGB suffix
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 11 Dec 2023 16:36:15 +0000
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	 <20231211162331.435900-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-12-11 at 16:23 +0000, Peter Griffin wrote:
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
>=20
> Have an incorrect DGB ending instead of DBG.
>=20
> This is an ABI break, but as the patch was only applied yesterday this
> header has never been in an actual release so it seems better to fix
> this early than ignore it.
>=20
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock manageme=
nt unit bindings")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


