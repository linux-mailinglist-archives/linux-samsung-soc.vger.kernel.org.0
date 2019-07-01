Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB52F55177
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jun 2019 16:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbfFYOVz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 25 Jun 2019 10:21:55 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44386 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbfFYOVz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 10:21:55 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so27370322edr.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jun 2019 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=24gzO0A0maaezXLn4Sf+YkjPoPGU5cIzahsVUvGWJpM=;
        b=Y+iwXU//8GiwvhB5OdOIwFWmfTwBckBPRRYgH6kue66lsWyh9dCVA2FaKmL02xFKEp
         ZfANSgyGzfjQvccuoaiACu2E9hFGEvf3GDPGF1PFAIvlKZ7isxVSmuGTE6shmB2zXpAr
         IoDUAySoIuAmV09dUoCcTV15LJhra9BJbO9AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=24gzO0A0maaezXLn4Sf+YkjPoPGU5cIzahsVUvGWJpM=;
        b=r88qNeQb4t64VzO4vJk45HCItKhSt/HFLO/UCG/DFIWfI2PtP7HNugjlsgAxOUbVno
         Cslc14lZHV231vsOHymd8q8sMfMWIynhdRd4eAjjpPf1PMnJz7j8hBhoKCuoTFUIkf4E
         Vgdi/UCDs6ULcCWeaM9M0a6e8xCKBdqtjJyDmbxJEIiVzavlr/a0P8oA31FNfSZlGMfn
         xhwQFGd4WYJ4cg1YiOTtJCMAChQF89Khh0j6TB1QZD6Qozz5AxO2PIaZ4Gq+XBxd3CD0
         SXi+mm1v+d3SL1MxeDD6rW8Eu2dPiMScu2Y5QOWU5nLMy7O5qtmFjarExERggJS8raxA
         6tbQ==
X-Gm-Message-State: APjAAAV3oR22atEavlc3H1LPlWM+AcqC3DgVviQVgh23t3IMIVVkKIFY
        LgmrTRQhvmtqxrOavKsCbnV1Og==
X-Google-Smtp-Source: APXvYqxVUUONdezXsW7E9TNE+qfMGQMUrSmhwkxeITlCJQHWjHZ7M6mojDMZlCgAoAGW7zba80GVtw==
X-Received: by 2002:aa7:d30b:: with SMTP id p11mr133074273edq.23.1561472512705;
        Tue, 25 Jun 2019 07:21:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id z2sm2477457ejp.73.2019.06.25.07.21.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 07:21:51 -0700 (PDT)
Date:   Tue, 25 Jun 2019 16:21:49 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     dri-devel@lists.freedesktop.org, kernel@collabora.com,
        m.szyprowski@samsung.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: Include ddc adapter pointer in struct
 drm_connector
Message-ID: <20190625142149.GW12905@phenom.ffwll.local>
Mail-Followup-To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        dri-devel@lists.freedesktop.org, kernel@collabora.com,
        m.szyprowski@samsung.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1561458051.git.andrzej.p@collabora.com>
 <ef88f682401ae863a91e6c885d83a2756ae20b85.1561458051.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef88f682401ae863a91e6c885d83a2756ae20b85.1561458051.git.andrzej.p@collabora.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 12:24:40PM +0200, Andrzej Pietrasiewicz wrote:
> Add generic code which creates symbolic links in sysfs, pointing to ddc
> interface used by a particular video output. For example:
> 
> ls -l /sys/class/drm/card0-HDMI-A-1/ddc
> lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/ddc \
> 	-> ../../../../soc/13880000.i2c/i2c-2
> 
> This makes it easy for user to associate a display with its ddc adapter
> and use e.g. ddcutil to control the chosen monitor.
> 
> This patch adds an i2c_adapter pointer to struct drm_connector. Particular
> drivers can then use it instead of using their own private instance. If a
> connector contains a ddc, then create a symbolic link in sysfs.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

As mentioned in the other subthread, I think the important bit to sell
this is rolling it out to as many drivers as feasible and collecting all
the acks from driver maintainers.
-Daniel
> ---
>  drivers/gpu/drm/drm_sysfs.c |  7 +++++++
>  include/drm/drm_connector.h | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index ad10810bc972..26d359b39785 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -294,6 +294,9 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>  	/* Let userspace know we have a new connector */
>  	drm_sysfs_hotplug_event(dev);
>  
> +	if (connector->ddc)
> +		return sysfs_create_link(&connector->kdev->kobj,
> +				 &connector->ddc->dev.kobj, "ddc");
>  	return 0;
>  }
>  
> @@ -301,6 +304,10 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
>  {
>  	if (!connector->kdev)
>  		return;
> +
> +	if (connector->ddc)
> +		sysfs_remove_link(&connector->kdev->kobj, "ddc");
> +
>  	DRM_DEBUG("removing \"%s\" from sysfs\n",
>  		  connector->name);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index ca745d9feaf5..1ad3d1d54ba7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -23,6 +23,7 @@
>  #ifndef __DRM_CONNECTOR_H__
>  #define __DRM_CONNECTOR_H__
>  
> +#include <linux/i2c.h>
>  #include <linux/list.h>
>  #include <linux/llist.h>
>  #include <linux/ctype.h>
> @@ -1308,6 +1309,16 @@ struct drm_connector {
>  	 * [0]: progressive, [1]: interlaced
>  	 */
>  	int audio_latency[2];
> +
> +	/**
> +	 * @ddc: associated ddc adapter.
> +	 * A connector usually has its associated ddc adapter. If a driver uses
> +	 * this field, then an appropriate symbolic link is created in connector
> +	 * sysfs directory to make it easy for the user to tell which i2c
> +	 * adapter is for a particular display.
> +	 */
> +	struct i2c_adapter *ddc;
> +
>  	/**
>  	 * @null_edid_counter: track sinks that give us all zeros for the EDID.
>  	 * Needed to workaround some HW bugs where we get all 0s
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
