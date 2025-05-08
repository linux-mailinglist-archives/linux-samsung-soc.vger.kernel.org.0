Return-Path: <linux-samsung-soc+bounces-8389-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A535AB0524
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 May 2025 23:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75329189DF9C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 May 2025 21:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF7521D3EF;
	Thu,  8 May 2025 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDcANHHv"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633BF2163BD;
	Thu,  8 May 2025 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738115; cv=none; b=NdqcqqPZVSQgs7OREnS37nPrA2SoPuwc2+uDjRJWZA2oEnmCEc5ukxc/er1gNFUgBVpwZbknxupFR1SFckY0NfY52Nx7s8WI5GzMGB89fbJu0YrKkbWsN2DIzp+nqFWsx42Gxd4otq2B3W21UGjl608MJjhTmKcu4LUU1lYLGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738115; c=relaxed/simple;
	bh=yPdOGFTeZlQxWn2TKGbf4D34zWBOx2mSseNPYh4tUpE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=bqTJ/DPlfaIal1az2+0vRnhw8t8D0iW6xdZsKDd8uJu5NgY83549WPv9hp6CkbT+DSAlheAZDhdhxCxwWzx5kMhCpnKl8W0lgF+WToJjGciPlGkHhhxRCTahDQ6EGWEQKmwcjV8ODND1h72KJZECIFCOozYs+jhXuM5nVxCPibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDcANHHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90AAC4CEF1;
	Thu,  8 May 2025 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746738114;
	bh=yPdOGFTeZlQxWn2TKGbf4D34zWBOx2mSseNPYh4tUpE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vDcANHHvJ/7W5hB7Irg9yt8c9BB6CR3oQXFrUXNyX1jJYx3OikZhbm2dCdEHERmVq
	 LEfPVOe/2oGtxK8heJUO152csjkspyAdgJEpJBBn4L5weIjo1HQ9n29JtvpdKNKBy1
	 1AzBtI9GEVIJ6Na8SdIUHr3AQm39sfbOZHVmtQkGmD7y/Qw3iMJQxWkngp2wlZvaJs
	 pJOm8ua9v74aQ1eqr0nh+1EgEmYYQRAT6C/J/AQ9v5dmBfb6ogBZzs8B7XlxLyLSIA
	 pffGSU+5xpR9sbnrs+orXmNFrPLK4BT8BmSuCquuwlcD/sPV8DLlTlANBiiVb1rM2W
	 a6aL5B44WDUoA==
Message-ID: <43a26fb44baa417a4fe2663d86909c0e@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250326-s2mps11-ubsan-v1-1-fcc6fce5c8a9@linaro.org>
References: <20250326-s2mps11-ubsan-v1-1-fcc6fce5c8a9@linaro.org>
Subject: Re: [PATCH] clk: s2mps11: initialise clk_hw_onecell_data::num before accessing ::hws[] in probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-hardening@vger.kernel.org, stable@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Gustavo A. R. Silva <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 May 2025 14:01:52 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Andr=C3=A9 Draszik (2025-03-26 05:08:00)
> With UBSAN enabled, we're getting the following trace:
>=20
>     UBSAN: array-index-out-of-bounds in .../drivers/clk/clk-s2mps11.c:186=
:3
>     index 0 is out of range for type 'struct clk_hw *[] __counted_by(num)=
' (aka 'struct clk_hw *[]')
>=20
> This is because commit f316cdff8d67 ("clk: Annotate struct
> clk_hw_onecell_data with __counted_by") annotated the hws member of
> that struct with __counted_by, which informs the bounds sanitizer about
> the number of elements in hws, so that it can warn when hws is accessed
> out of bounds.
>=20
> As noted in that change, the __counted_by member must be initialised
> with the number of elements before the first array access happens,
> otherwise there will be a warning from each access prior to the
> initialisation because the number of elements is zero. This occurs in
> s2mps11_clk_probe() due to ::num being assigned after ::hws access.
>=20
> Move the assignment to satisfy the requirement of assign-before-access.
>=20
> Cc: stable@vger.kernel.org
> Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __cou=
nted_by")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Applied to clk-fixes

