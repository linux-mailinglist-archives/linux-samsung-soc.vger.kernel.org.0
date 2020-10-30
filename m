Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016F12A0250
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Oct 2020 11:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgJ3KJi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Oct 2020 06:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgJ3KI7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 06:08:59 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6A2C0613E1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2020 03:08:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v5so2312028wmh.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2020 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLRenZ+k6OnrWeyL17PS5vv24685dEitAu61SyAKZwA=;
        b=GXHxO1RP7TK95Adu5+iOnFzwfvM1BylUWHit0kEyTRTLVttqP1P3S95IoPuxbcmlFB
         5Ozb+6/u63pPnXm1hxcZRtaICRTk3yz0dsT7WEHo9xO0nj24N6aRdnRJ88svYaFT4zH1
         M/1kNldB+IOH+DlAmBexn1ek5RHkrsQQkz1dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLRenZ+k6OnrWeyL17PS5vv24685dEitAu61SyAKZwA=;
        b=dlGjxOleJo8bHXvEQ+eMc1aZ5sXAMXWXb5mJkQs2zN99yWIzMAIG+L11zz2XYGhKjK
         mfl6HKiCzLrVJmVyLSXC3Bjk3PEAHDon7rWi09HUwzHyD5B4i63k31KBQl7pFe67Wxan
         gBp9VB8/wMLKG0HigSOXt07kg6nmql62bq5RYXmhnIhTjPEv2EcqN5KahHSDdOHvQBsA
         FIDQQIeykEhbLl08+MPKSd1fb+KtyX9ihmVMsWZ8Q+kUoxSSTMlSRsbLP1QC1ebcTkPo
         WqO7WpIa4ZUn4OtKSH24sdDsAz572BSK5eZwVF4p0/TmhmLDQ2vQWxk/HsA2aV47P1/t
         tKrQ==
X-Gm-Message-State: AOAM531BoHtY99EoWLnaB6Lre+eNDt4och38iQ//raN/Ihd3khPz5cms
        xMkzbuVENBclG+E/TZhw7IfSmQ==
X-Google-Smtp-Source: ABdhPJz/i1hJloa86kniLQRB2Ym3mXkp18H0V5ZxOvETtprEDfWEpkrDMUxmmStycaPdhj+fBSAIzQ==
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr1715102wmk.65.1604052536620;
        Fri, 30 Oct 2020 03:08:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 03:08:55 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
        David Hildenbrand <david@redhat.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v5 13/15] resource: Move devmem revoke code to resource framework
Date:   Fri, 30 Oct 2020 11:08:13 +0100
Message-Id: <20201030100815.2269-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We want all iomem mmaps to consistently revoke ptes when the kernel
takes over and CONFIG_IO_STRICT_DEVMEM is enabled. This includes the
pci bar mmaps available through procfs and sysfs, which currently do
not revoke mappings.

To prepare for this, move the code from the /dev/kmem driver to
kernel/resource.c.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kees Cook <keescook@chromium.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Hildenbrand <david@redhat.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
--
v3:
- add barrier for consistency and document why we don't have to check
  for NULL (Jason)
v4
- Adjust comments to reflect the general nature of this iomem revoke
  code now (Dan)
---
 drivers/char/mem.c     |  85 +---------------------------------
 include/linux/ioport.h |   6 +--
 kernel/resource.c      | 101 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 102 insertions(+), 90 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 7dcf9e4ea79d..43c871dc7477 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -31,9 +31,6 @@
 #include <linux/uio.h>
 #include <linux/uaccess.h>
 #include <linux/security.h>
-#include <linux/pseudo_fs.h>
-#include <uapi/linux/magic.h>
-#include <linux/mount.h>
 
 #ifdef CONFIG_IA64
 # include <linux/efi.h>
@@ -836,42 +833,6 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
 	return ret;
 }
 
-static struct inode *devmem_inode;
-
-#ifdef CONFIG_IO_STRICT_DEVMEM
-void revoke_devmem(struct resource *res)
-{
-	/* pairs with smp_store_release() in devmem_init_inode() */
-	struct inode *inode = smp_load_acquire(&devmem_inode);
-
-	/*
-	 * Check that the initialization has completed. Losing the race
-	 * is ok because it means drivers are claiming resources before
-	 * the fs_initcall level of init and prevent /dev/mem from
-	 * establishing mappings.
-	 */
-	if (!inode)
-		return;
-
-	/*
-	 * The expectation is that the driver has successfully marked
-	 * the resource busy by this point, so devmem_is_allowed()
-	 * should start returning false, however for performance this
-	 * does not iterate the entire resource range.
-	 */
-	if (devmem_is_allowed(PHYS_PFN(res->start)) &&
-	    devmem_is_allowed(PHYS_PFN(res->end))) {
-		/*
-		 * *cringe* iomem=relaxed says "go ahead, what's the
-		 * worst that can happen?"
-		 */
-		return;
-	}
-
-	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
-}
-#endif
-
 static int open_port(struct inode *inode, struct file *filp)
 {
 	int rc;
@@ -891,7 +852,7 @@ static int open_port(struct inode *inode, struct file *filp)
 	 * revocations when drivers want to take over a /dev/mem mapped
 	 * range.
 	 */
-	filp->f_mapping = inode->i_mapping;
+	filp->f_mapping = iomem_get_mapping();
 
 	return 0;
 }
@@ -1023,48 +984,6 @@ static char *mem_devnode(struct device *dev, umode_t *mode)
 
 static struct class *mem_class;
 
-static int devmem_fs_init_fs_context(struct fs_context *fc)
-{
-	return init_pseudo(fc, DEVMEM_MAGIC) ? 0 : -ENOMEM;
-}
-
-static struct file_system_type devmem_fs_type = {
-	.name		= "devmem",
-	.owner		= THIS_MODULE,
-	.init_fs_context = devmem_fs_init_fs_context,
-	.kill_sb	= kill_anon_super,
-};
-
-static int devmem_init_inode(void)
-{
-	static struct vfsmount *devmem_vfs_mount;
-	static int devmem_fs_cnt;
-	struct inode *inode;
-	int rc;
-
-	rc = simple_pin_fs(&devmem_fs_type, &devmem_vfs_mount, &devmem_fs_cnt);
-	if (rc < 0) {
-		pr_err("Cannot mount /dev/mem pseudo filesystem: %d\n", rc);
-		return rc;
-	}
-
-	inode = alloc_anon_inode(devmem_vfs_mount->mnt_sb);
-	if (IS_ERR(inode)) {
-		rc = PTR_ERR(inode);
-		pr_err("Cannot allocate inode for /dev/mem: %d\n", rc);
-		simple_release_fs(&devmem_vfs_mount, &devmem_fs_cnt);
-		return rc;
-	}
-
-	/*
-	 * Publish /dev/mem initialized.
-	 * Pairs with smp_load_acquire() in revoke_devmem().
-	 */
-	smp_store_release(&devmem_inode, inode);
-
-	return 0;
-}
-
 static int __init chr_dev_init(void)
 {
 	int minor;
@@ -1086,8 +1005,6 @@ static int __init chr_dev_init(void)
 		 */
 		if ((minor == DEVPORT_MINOR) && !arch_has_dev_port())
 			continue;
-		if ((minor == DEVMEM_MINOR) && devmem_init_inode() != 0)
-			continue;
 
 		device_create(mem_class, NULL, MKDEV(MEM_MAJOR, minor),
 			      NULL, devlist[minor].name);
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 5135d4b86cd6..02a5466245c0 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -307,11 +307,7 @@ struct resource *devm_request_free_mem_region(struct device *dev,
 struct resource *request_free_mem_region(struct resource *base,
 		unsigned long size, const char *name);
 
-#ifdef CONFIG_IO_STRICT_DEVMEM
-void revoke_devmem(struct resource *res);
-#else
-static inline void revoke_devmem(struct resource *res) { };
-#endif
+extern struct address_space *iomem_get_mapping(void);
 
 #endif /* __ASSEMBLY__ */
 #endif	/* _LINUX_IOPORT_H */
diff --git a/kernel/resource.c b/kernel/resource.c
index 3ae2f56cc79d..5ecc3187fe2d 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -18,12 +18,15 @@
 #include <linux/spinlock.h>
 #include <linux/fs.h>
 #include <linux/proc_fs.h>
+#include <linux/pseudo_fs.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/pfn.h>
 #include <linux/mm.h>
+#include <linux/mount.h>
 #include <linux/resource_ext.h>
+#include <uapi/linux/magic.h>
 #include <asm/io.h>
 
 
@@ -1115,6 +1118,58 @@ resource_size_t resource_alignment(struct resource *res)
 
 static DECLARE_WAIT_QUEUE_HEAD(muxed_resource_wait);
 
+static struct inode *iomem_inode;
+
+#ifdef CONFIG_IO_STRICT_DEVMEM
+static void revoke_iomem(struct resource *res)
+{
+	/* pairs with smp_store_release() in iomem_init_inode() */
+	struct inode *inode = smp_load_acquire(&iomem_inode);
+
+	/*
+	 * Check that the initialization has completed. Losing the race
+	 * is ok because it means drivers are claiming resources before
+	 * the fs_initcall level of init and prevent iomem_get_mapping users
+	 * from establishing mappings.
+	 */
+	if (!inode)
+		return;
+
+	/*
+	 * The expectation is that the driver has successfully marked
+	 * the resource busy by this point, so devmem_is_allowed()
+	 * should start returning false, however for performance this
+	 * does not iterate the entire resource range.
+	 */
+	if (devmem_is_allowed(PHYS_PFN(res->start)) &&
+	    devmem_is_allowed(PHYS_PFN(res->end))) {
+		/*
+		 * *cringe* iomem=relaxed says "go ahead, what's the
+		 * worst that can happen?"
+		 */
+		return;
+	}
+
+	unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
+}
+struct address_space *iomem_get_mapping(void)
+{
+	/*
+	 * This function is only called from file open paths, hence guaranteed
+	 * that fs_initcalls have completed and no need to check for NULL. But
+	 * since revoke_iomem can be called before the initcall we still need
+	 * the barrier to appease checkers.
+	 */
+	return smp_load_acquire(&iomem_inode)->i_mapping;
+}
+#else
+static void revoke_iomem(struct resource *res) {}
+struct address_space *iomem_get_mapping(void)
+{
+	return NULL;
+}
+#endif
+
 /**
  * __request_region - create a new busy resource region
  * @parent: parent resource descriptor
@@ -1182,7 +1237,7 @@ struct resource * __request_region(struct resource *parent,
 	write_unlock(&resource_lock);
 
 	if (res && orig_parent == &iomem_resource)
-		revoke_devmem(res);
+		revoke_iomem(res);
 
 	return res;
 }
@@ -1782,4 +1837,48 @@ static int __init strict_iomem(char *str)
 	return 1;
 }
 
+static int iomem_fs_init_fs_context(struct fs_context *fc)
+{
+	return init_pseudo(fc, DEVMEM_MAGIC) ? 0 : -ENOMEM;
+}
+
+static struct file_system_type iomem_fs_type = {
+	.name		= "iomem",
+	.owner		= THIS_MODULE,
+	.init_fs_context = iomem_fs_init_fs_context,
+	.kill_sb	= kill_anon_super,
+};
+
+static int __init iomem_init_inode(void)
+{
+	static struct vfsmount *iomem_vfs_mount;
+	static int iomem_fs_cnt;
+	struct inode *inode;
+	int rc;
+
+	rc = simple_pin_fs(&iomem_fs_type, &iomem_vfs_mount, &iomem_fs_cnt);
+	if (rc < 0) {
+		pr_err("Cannot mount iomem pseudo filesystem: %d\n", rc);
+		return rc;
+	}
+
+	inode = alloc_anon_inode(iomem_vfs_mount->mnt_sb);
+	if (IS_ERR(inode)) {
+		rc = PTR_ERR(inode);
+		pr_err("Cannot allocate inode for iomem: %d\n", rc);
+		simple_release_fs(&iomem_vfs_mount, &iomem_fs_cnt);
+		return rc;
+	}
+
+	/*
+	 * Publish iomem revocation inode initialized.
+	 * Pairs with smp_load_acquire() in revoke_iomem().
+	 */
+	smp_store_release(&iomem_inode, inode);
+
+	return 0;
+}
+
+fs_initcall(iomem_init_inode);
+
 __setup("iomem=", strict_iomem);
-- 
2.28.0

