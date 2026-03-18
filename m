Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8A165F16
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807376; cv=none; b=RDSWDtOczz7lDcHYnTb1YqMb4GSA+8XBIyPIn7c8kV3eR7TcR6/7WUjw9X9L/IwmgJfwfvlizIJBkldzLSxYI2PCxAdm/yYIU1eBJm5c5OmfNdSCkbfxiHQidtvTcusXkbNhBrBBsdy1R1KtgjkszjAjkXSN/+hbQt2uovaQe0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807376; c=relaxed/simple;
	bh=Bl3WeNXsYwqhtCfUXVQyix1i9349h84AWX2WLJCmfic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHThgyIdrMCsHMXqCEnPsIPts9JGpQai6cUk43E9FSDdRfad+nhU78qVWWh2LU0bATc8eDpiQHA+DNTX247tIrN8wWHPBxwKCHnKOq2AIxnN/pGgXTPKSAYlHxnW0v0gXsXFYmTNX3nXJqJ1J77oFrLk4NxEHGX0Q8iYKrYeCkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTyQtSiF; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTyQtSiF"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c955a481so1667330eec.1
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 21:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773807374; x=1774412174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
        b=gTyQtSiF1VgvtTgDXPDhKmrJSolQAxCl0ED911myQRJxwSBSFtUsz9lCUfCPMSZWK7
         o0Ub/r4jk5nRqZ6jECsSzKu1kTMUzLUIP+LcPcIiycvzUFnSS4E1xmkcUSVzyJx0W+RW
         m8oyH/5Jzn7JMBJVKVYUoc3MqR92cWXdY3NT+I1AtlcRxF4aGy3j4UD4oTJTjJkmfMrd
         W2WEU2ufrIntw0O29cPQBpuHs1euwp0kNYRLsYpyhNChAwNVw2MglTMl38NxLRxpV+D8
         xJEllxFk1k+Hc4CcxHraL+TaKTRAVf4OYs51Fqd7wmu+1A2IVhY4BZSqYUdV/BJ7fpcB
         /15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773807374; x=1774412174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZvDiA5OjEH9jB/X3wjJ3qQao5asOiEdEuR+UFxLqYM=;
        b=sia9lR0Pa5QA9z8altsjqUcsJDEgoMrppEg23HWb/yjKU1iJIZ/Dpv5dlOjImNpswZ
         HD8YRupJhv8A7NAnb+8ktvS6m8dAXNiRZBY7BSs+sxNFOZk4puWZWRjL+9wBQeyeQynB
         gudA8gwnmUaZQ+Xwur6ZRitF2oKPp7jwRWybi+p34cQ3WX73D46fk0xw7pYXrLCNGpD5
         vUKa2iOwtkGZUjG3MOHmn/I7FY4aaJXcz4tfdBo7Uv9zu8OqApOK4omlZnE7slWnYM2Z
         3Th/kbBWo26Rr7LYcdnTCfCZAL193lN7qyhVYmu8ZfiiwUicIQef/OgWlVIQBs8+3Jk2
         dVJw==
X-Forwarded-Encrypted: i=1; AJvYcCXDSll7HNQTllB2y8ZwrgZSNdQOBFXem0lUiy7zhXPs3aOa6JuABaeW4ZDh+aQtuZK4GYrcXkEunpQrYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YytrDMSoiuP9Bh5f7meTSfj8fIyasr/1i/5SJJGaWYzj86nsO2H
	I0WFTRed13mEm4ywnX7TGj1RfY5t3p+VQIa1PafLX8MYh8fNE0NNqpOg
X-Gm-Gg: ATEYQzycR4Qfrp2tqpjADighE+c6eV6HFKhZ7QnOMGSYreb3eMlubpQty9m2MI277lg
	wcSRfXs9TVjgoW/4GRbu8d9Qu9QUVJgNngarHy5s7jziPEVaA/K+1lvoWq/7HwvHm2nv7hb7Olh
	jCOPNuusKJGFf6MGMmaEmX4BgwaObBLm50Bqeo4twWukIoOGmF5YRtjfNbcAVil92vZm0a3mxh1
	LEPhqAQUC8YJlJ4bJpU/MBXKSxTwQ8IjrNkWEDNTcJlzcM8aaChE35xigaCRwTvBuGzYgpEFmFZ
	0vHq9bLtFhMw8GD7miN6UYViOTLRii3/yBNDIQVNY+/yr2W2D3thbiKOLuy+O2LYakIypy7N+10
	mssMQrvg6G4lHal90ldzymCoOdWwBdLGRJnyG/1cFaqGn6kH2HAxSa5eE8gicD2Cx4mYnwFm1kS
	1v42oQpmWR0ehA28Ye1T9yMwvxWHDBMOE03XKRqncXwWINhzYosCM7gepiT/mJ3MDpHQfTvIwiE
	d9NYyC8aMLTjINialvWwC8wvzXkVcKRhb9QcnqZ4FZI3Gaytvv3H3U5K6hwVMhZfP1HZDIr
X-Received: by 2002:a05:693c:2c06:b0:2be:833c:14a6 with SMTP id 5a478bee46e88-2c0e5044091mr1153364eec.15.1773807373685;
        Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
Received: from 2045L.localdomain (130.sub-75-229-251.myvzw.com. [75.229.251.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm2790870eec.31.2026.03.17.21.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:16:13 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: hanguidong02@gmail.com
Cc: akaieurus@gmail.com,
	dakr@kernel.org,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	me@ziyao.cc,
	pierre-louis.bossart@linux.dev,
	rafael@kernel.org,
	rander.wang@intel.com,
	vkoul@kernel.org,
	yangshiguang@xiaomi.com,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH 3/4] soundwire: debugfs: initialize firmware_file to empty string
Date: Wed, 18 Mar 2026 12:14:28 +0800
Message-ID: <20260318041446.9066-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317191029.43515-1-hanguidong02@gmail.com>
References: <20260317191029.43515-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Mar 18, 2026 at 3:11 AM Gui-Dong Han <hanguidong02@gmail.com> wrote:
>
> Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> upon reading, and creating debugfs nodes with NULL string pointers is no
> longer permitted. Change the initialization of firmware_file to an
> allocated empty string. Existing driver code using this field handles
> empty strings correctly.
>
> Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
> Reported-by: yangshiguang <yangshiguang@xiaomi.com>
> Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
>  drivers/soundwire/debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index ccc9670ef77c..d4abe8bfca76 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -358,8 +358,9 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
>         debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
>
>         debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
> -       firmware_file = NULL;
> -       debugfs_create_str("firmware_file", 0200, d, &firmware_file);
> +       firmware_file = devm_kstrdup(&slave->dev, "", GFP_KERNEL);
> +       if (firmware_file)
> +               debugfs_create_str("firmware_file", 0200, d, &firmware_file);

I initially patterned this fix after commit 8cc27f5c6dd1 [1] by using
devm_kstrdup(). However, I realized that approach is flawed:
debugfs_write_file_str() calls a raw kfree(), which causes a mismatch.
I have submitted a separate patch [2] to fix that existing commit.

Additionally, firmware_file is a global pointer in this driver. The
original code blindly overwrote it with NULL every time a new slave was
added.

To fix both issues properly, I moved the allocation to the subsystem
init and exit paths so it is only allocated once.

The updated v2 patch is included below for review. I will wait for
further comments on the rest of the series and include this updated
patch if a full v2 series is required.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1
[2] https://lore.kernel.org/linux-pm/20260318024815.7655-1-hanguidong02@gmail.com/

From bbaff3bc33746a965a2387ffe8302d05e700a1c3 Mon Sep 17 00:00:00 2001
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 03:10:29 +0800
Subject: [PATCH v2 3/4] soundwire: debugfs: initialize firmware_file to empty string

Passing NULL to debugfs_create_str() causes a NULL pointer dereference,
and creating debugfs nodes with NULL string pointers is no longer
permitted.

Additionally, firmware_file is a global pointer. Previously, adding every
new slave blindly overwrote it with NULL.

Fix these issues by initializing firmware_file to an allocated empty
string once in the subsystem init path (sdw_debugfs_init), and freeing
it in the exit path. Existing driver code handles empty strings
correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* Replace devm_kstrdup() with kstrdup() to fix allocation/free mismatch
with debugfs.
* Move initialization to subsystem init/exit paths to avoid overwriting
the global pointer on every slave probe.
---
 drivers/soundwire/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..2905ec19b838 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
@@ -371,10 +371,15 @@ void sdw_slave_debugfs_exit(struct sdw_slave *slave)
 
 void sdw_debugfs_init(void)
 {
+	if (!firmware_file)
+		firmware_file = kstrdup("", GFP_KERNEL);
+
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
 
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	kfree(firmware_file);
+	firmware_file = NULL;
 }
-- 
2.43.0

