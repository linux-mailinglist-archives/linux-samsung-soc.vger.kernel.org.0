Return-Path: <linux-samsung-soc+bounces-3192-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDF8C85A3
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 May 2024 13:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5D0F286F49
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 May 2024 11:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E3E3F8F0;
	Fri, 17 May 2024 11:25:54 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3C3EA96;
	Fri, 17 May 2024 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715945154; cv=none; b=p8xtTDjjqrcLult0bYcMblAG073afedfHeF6ZnTE2mFy4TkBKiTEj9VlSCA1+xM5o2z637uXhNQGw4OA1lv5OmwMsXMLvNkFS0Bcib0lzj4U+YQT+M99rDLjFgrbzDIVtidA6P7ROh3FSOvD739bsfubecws3rCwWGHYZpRVeXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715945154; c=relaxed/simple;
	bh=YQD6Oa1cvhYYwr0pr6C99jnus7JsR3UQ5GTpM2jcU0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORCLnid006ZfpUoR1jcF4lO3Ims190sd+HbAnP7zdSxHeGx02QFcKIAa6blN9X/WVmyfHa5rtG9zegA66805wIG/J+WfWnardjcQL26RmrUrQbj+HtzYigr9cc7cegnYKoztFqpMS0/H2Qd6sL0bvKe1PtqWbZG8P0TD6qgt+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e651a9f3ffso3663005ad.1;
        Fri, 17 May 2024 04:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715945152; x=1716549952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4GCEW7v7eGQqDO26j+0ZU9xZzL+oZKID2CvFQ0zRWY=;
        b=M5UetKMpp8LBV172ZAqcMcwHXz0y3YHB61zKda/9Boj7Lsu7qCbqRBlPRHmn2G1yu4
         rnlRDZLW+vCvPYlvW2dC5DMzCEWUDMjyCtXfvWpQeThwf3qxCInpNxyRkTVlZz4iRHKR
         ouLuK5/h9HP0y8tv94urhT01UzHp/DodjUTN3TNBVg8lLLZ0d5fHX31LP2057cnibM0w
         kiABkgbjIJXuGg5V/RKE4l1mC7pMbHyG6sI/LUXB/NFl/iULzSt5ApJ3gqnYyAxUJSoY
         MEfXKjXafPXHxPAF+tmHBCaY3/jf9MFehV8fKW4YdTPnLsjzBFmOER5Pdbc2e5pB4kWy
         eSyw==
X-Forwarded-Encrypted: i=1; AJvYcCVQdX4GXkV/DCKMSsSSbFu8y/N1CwjIpzAbgl+zinUqCo1PzZjkevMu+a15sjRGmahBXO2nznhgpyWJriEk22rQ8g/DvY8vWdDHwtaexkYlshjFhVSLJ4lKXCRaj92WX5l2i4gTXYV+MhcZhfZqiZTs+iEAIzWHoELhSY1rhu158cdmZOBsc+lLdOc=
X-Gm-Message-State: AOJu0YzcN2l31VhHly8VWwhhl7kCCpo+PcUKxhWIKxLAHW7nH7QnwWNG
	ZqwbrHD3TK+GcEKt7tqTuPbCbUBJHfq6rmbdsby6zzJxPZsvb2qI
X-Google-Smtp-Source: AGHT+IGPMFl/9tHC0W4aLrDbJxxtvZ3LF8vKCdbg3fSTX9TNDbvUg3HTztrjjFNchvAnQVoYDZNYeA==
X-Received: by 2002:a17:902:fc4f:b0:1e8:c962:4f6e with SMTP id d9443c01a7336-1ef43d27f6fmr242204245ad.20.1715945152598;
        Fri, 17 May 2024 04:25:52 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm157485665ad.134.2024.05.17.04.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:25:52 -0700 (PDT)
Date: Fri, 17 May 2024 20:25:50 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com,
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
	linux@armlinux.org.uk, m.szyprowski@samsung.com,
	manivannan.sadhasivam@linaro.org, pankaj.dubey@samsung.com,
	gost.dev@samsung.com
Subject: Re: [PATCH v6 2/2] PCI: exynos: Adapt to clk_bulk_* APIs
Message-ID: <20240517112550.GW202520@rocinante>
References: <20240220084046.23786-1-shradha.t@samsung.com>
 <CGME20240220084125epcas5p28c6d886685006800fc26c11918d5d1dd@epcas5p2.samsung.com>
 <20240220084046.23786-3-shradha.t@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220084046.23786-3-shradha.t@samsung.com>

Hello,

> There is no need to hardcode the clock info in the driver as driver can
> rely on the devicetree to supply the clocks required for the functioning
> of the peripheral. Get rid of the static clock info and obtain the
> platform supplied clocks. All the clocks supplied is obtained and enabled
> using the devm_clk_bulk_get_all_enable() API.

Applied to controller/exynos, thank you!

[1/1] PCI: exynos: Adapt to use bulk clock APIs
      https://git.kernel.org/pci/pci/c/358e579a9da2

	Krzysztof

