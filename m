Return-Path: <linux-samsung-soc+bounces-1440-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE283EA4D
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Jan 2024 03:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 939891C22157
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Jan 2024 02:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C44AB67F;
	Sat, 27 Jan 2024 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhpXP3nn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8711715
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706324364; cv=none; b=IfMXSmcW0Qv/8iuRC6TEuCFEtzLgmx18rH2Sexe+LnytYXxc/9bAq6f8oKTwd1K5IFZx47Af2nptmBbFGxcu5m8T8YDNEnOZuogwy7qEdSQQxoH2wu9+Yt6N3U6hrb5KH8eBxKidVtyDLYuTEbkofVhfCYpbYAmAaDSO8UaLU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706324364; c=relaxed/simple;
	bh=WmFyh1gAjZSIWJVb6puGSQWn34eC4+KqXe8Mcce2twM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrDQuotft3ZEyUazQbZJ2ThgxEJpe6rffRQDUryORmWZ4HYxgGig4xS9/HkjrY2w/LvZy1mkqCNy7+Jv+gHYAcpFK0JkXschgyIyK/3MVW4hyv63fmX62Ysi10xzv9WzmlnVmlZrOoISbat+8HnwkQFmq8TKQ96dh2se8mHMx5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhpXP3nn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d89518d3b1so6464995ad.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706324363; x=1706929163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KP4nCJEGG4GCo5MbebojBtpejN/vWBmcTtdBwYgV3A=;
        b=ZhpXP3nnJytoZXuJJSrZ3p/sVNEBfwOL1ZABcOFbP7JQLDpySnWi2AUVxxtF3eevL4
         V+MOqVkKAZ3dki4alQOoi9M9/ZsOUvSwih4IvwT0oDwHeGStS/aJ2He8gi66UxFWCRI/
         IXiZi/BVMfbTJWk1tVs6R1D08+IiK8XzQHDefzP14MaLKTNElBL1FYAJ2QBGmhRmBDNw
         qNIYwWMB0bRXM8Nh4l2jRaLK9vTXsudGa7VKeraTc4ghS/pJLpRSUpBUUzJpnd7uI2b9
         MzhX1/0xdLb6eY1uqlT+Zhvvyph3ZzSt8dSVuNRu3WfuDcSQiKE+VPswOC/feRW+mRO9
         rmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706324363; x=1706929163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KP4nCJEGG4GCo5MbebojBtpejN/vWBmcTtdBwYgV3A=;
        b=vMzrEeLkx91t0jbfAemCqS0q5/v6tB+7nEsPKeZBix6vdJP/fidFFnT4HTQc4/MAdb
         9ZOFTANrT7HZ81HdMUbsMlZUaf/HVP8eZ4NoQ6CSCO3fa7eYHRENjmckd+Yfvs9YRrLf
         fenAXzmxCFd4MvOxbPj5gNk3x+Hn8K7iWVug1YoNSZP770HGX2ManSexn6uItBexaRi/
         q8IW/p8qsHP5OdgY2R2h4JsXd6aWCd5abr9/8LpeEB5/dNRRyzs+cNnn4EA8p/uxwssF
         UKgdNx6Hwnr4LaqhEvewiCRT6rgPLCo/uzdsCw5Y4Qf5dMaNHBNoM/Q9OtqR07vJBQ46
         Rb1g==
X-Gm-Message-State: AOJu0YwZbSXutE338lFje/S0hJrLLlu1L7BOZhsTaHM2sOel3silgDyG
	F14Np6i5HJDWfTFNwechk+tf6GaZEFayt0FKvroKOUTJJuUXPQcd5I+LVplnUl0k1a4jxNPidS6
	MjYJnBpeHj/56AVASSKr7LuXGIXup29GTjQNxQA==
X-Google-Smtp-Source: AGHT+IEpuk/bnYdrfB//r4vojtQLh3wjlLjB5AiarBWTVUl0eD46ZnaAPKBY/X4qeYNF1glHI5y7jEuqnsaWlwbzBE8=
X-Received: by 2002:a17:902:cf4c:b0:1d7:5289:41ba with SMTP id
 e12-20020a170902cf4c00b001d7528941bamr1206353plg.48.1706324362859; Fri, 26
 Jan 2024 18:59:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org> <20240127001926.495769-8-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-8-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 20:59:11 -0600
Message-ID: <CAPLW+4m3Yb82xu3OzWd4XiZz+06_e64KY_wBGuSPRP_UtQUYgQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: samsung: exynos-sysreg: gs101-peric1
 requires a clock
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Otherwise it won't be accessible.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
-sysreg.yaml
> index 33d837ae4f45..c0c6ce8fc786 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg=
.yaml
> @@ -73,6 +73,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-peric0-sysreg
> +              - google,gs101-peric1-sysreg
>                - samsung,exynos850-cmgp-sysreg
>                - samsung,exynos850-peri-sysreg
>                - samsung,exynos850-sysreg
> --
> 2.43.0.429.g432eaa2c6b-goog
>

