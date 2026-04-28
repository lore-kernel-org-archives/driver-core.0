Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BA37FF75
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 19:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405204; cv=none; b=VGo2hP1qSp0wS6nyMx3ZmFpI0GIJJ7ahnhOavUkjR/nPHf0rurLiB+/Uu83hu9zd2xVLskI0epUVXarTIrXv/1M+GAK4OvuXhsiw2hclwfb4OsBzcODPvj2gIgTNr4cDAoE/OUGKlBFx88sy72AKQdr0qciMyqH6JG2RlB1OO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405204; c=relaxed/simple;
	bh=5k0hyiBTcMgBBCN+iDn/P7llGcbufxk5ouv8VNl1kZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VscPnlFyzR6Pm83utrUezQTcuROp49HSgZGPK2OQQNFcz2fJGsxfJhZTlyehQI9JFLuDdRftTq8DelLcMZ89MGLO0GEUhX+k4jtd/aALGgCAYjkV5zV5jYgYzHqWP6zTjV8bC+YHixmlN5dKD5gzXs2pGzuaHCgnx40c4+P7b64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=tQ7NZSiR; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="tQ7NZSiR"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4g4rPH08N4zlfl7s;
	Tue, 28 Apr 2026 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1777405194; x=1779997195; bh=bBDxVFwrNDY0aG8iny6iB93g
	P7vI4vke9dicXMqT+nU=; b=tQ7NZSiRXswxrZaoWJGmUmDj/HNA1yNXqZ0nUdVc
	yCwqLwOeG+ueDgLu5lofHJ2xVZG911mVo0WaB2mZMVSoSsGrhoxS9F78MQ2fFTsL
	VZwh+DhpFqni+gf0n46utn430SoUjuJ3ZOz76SYmAw0LYTvck8O2VcUP/QaWVz1k
	zSkizskPNVvjWWvFCPgnUMcQJh20D29aCE0AOGwSgP+tE7MmnJoq83UlGl49wJMx
	UlEWPWmUpCOAekx/q+o7AQurrbtX3VyYwwqbVDQL+3jfxcrUorNJryGOZQTwm+Cq
	qpFcGCftEA0g75vu4GEoBzN8p6l9kHulD8kTm7Cid7Y1cA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ZqyCOTjvuFMp; Tue, 28 Apr 2026 19:39:54 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4g4rP26W3qzlfddp;
	Tue, 28 Apr 2026 19:39:50 +0000 (UTC)
Message-ID: <2fc4a2af-a4bb-4797-87eb-e95b835aa673@acm.org>
Date: Tue, 28 Apr 2026 12:39:49 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: base: Set mod->async_probe_requested if needed
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Igor Pylypiv <ipylypiv@google.com>,
 Chung-Kai Mei <chungkai@google.com>, stable@vger.kernel.org
References: <20260407160511.56289-1-bvanassche@acm.org>
 <DI4ZX1HOWDNH.3G36YTI0MYC76@kernel.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <DI4ZX1HOWDNH.3G36YTI0MYC76@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 11:22 AM, Danilo Krummrich wrote:
> What if userspace did explicitly pass async_probe=0?

Does this mean that what the user has configured should take precedence,
as in the untested patch below?

Thanks,

Bart.

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 218aaa096455..86f1f21a3d23 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -39,6 +39,10 @@ int module_add_driver(struct module *mod, const 
struct device_driver *drv)
  	if (!drv)
  		return 0;

+	if (mod && drv->probe_type == PROBE_PREFER_ASYNCHRONOUS &&
+	    mod->async_probe_requested == PROBE_TYPE_NOT_SET)
+		mod->async_probe_requested = PROBE_ASYNCHRONOUSLY;
+
  	if (mod)
  		mk = &mod->mkobj;
  	else if (drv->mod_name) {
diff --git a/include/linux/module.h b/include/linux/module.h
index 7566815fabbe..a946ad88c925 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -394,6 +394,12 @@ struct klp_modinfo {
  };
  #endif

+enum async_probe_type {
+	PROBE_TYPE_NOT_SET = 0,
+	PROBE_SYNCHRONOUSLY,
+	PROBE_ASYNCHRONOUSLY,
+} __packed;
+
  struct module {
  	enum module_state state;

@@ -442,7 +448,7 @@ struct module {
  	bool sig_ok;
  #endif

-	bool async_probe_requested;
+	enum async_probe_type async_probe_requested;

  	/* Exception table */
  	unsigned int num_exentries;
@@ -760,7 +766,7 @@ extern void print_modules(void);

  static inline bool module_requested_async_probing(struct module *module)
  {
-	return module && module->async_probe_requested;
+	return module && module->async_probe_requested == PROBE_ASYNCHRONOUSLY;
  }

  static inline bool is_livepatch_module(struct module *mod)
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a605..9e2d9c9f65fa 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3065,8 +3065,30 @@ void flush_module_init_free_work(void)
  #undef MODULE_PARAM_PREFIX
  #define MODULE_PARAM_PREFIX "module."
  /* Default value for module->async_probe_requested */
-static bool async_probe;
-module_param(async_probe, bool, 0644);
+static enum async_probe_type async_probe;
+
+static int async_probe_set(const char *val, const struct kernel_param *kp)
+{
+	bool async;
+	int ret;
+
+	ret = kstrtobool(val, &async);
+	if (ret)
+		return ret;
+	async_probe = async ? PROBE_ASYNCHRONOUSLY : PROBE_SYNCHRONOUSLY;
+	return 0;
+}
+
+static int async_probe_get(char *buffer, const struct kernel_param *kp)
+{
+	return sysfs_emit(buffer, "%d", async_probe == PROBE_ASYNCHRONOUSLY);
+}
+
+static struct kernel_param_ops async_probe_ops = {
+	.set = async_probe_set,
+	.get = async_probe_get,
+};
+module_param_cb(async_probe, &async_probe_ops, &async_probe, 0644);

  /*
   * This is where the real work happens.
@@ -3135,7 +3157,7 @@ static noinline int do_init_module(struct module *mod)
  	 * See commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
  	 * request_module() from async workers") for more details.
  	 */
-	if (!mod->async_probe_requested)
+	if (mod->async_probe_requested != PROBE_ASYNCHRONOUSLY)
  		async_synchronize_full();

  	ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
@@ -3366,12 +3388,16 @@ static int prepare_coming_module(struct module *mod)
  static int unknown_module_param_cb(char *param, char *val, const char 
*modname,
  				   void *arg)
  {
+	bool async_probe_requested;
  	struct module *mod = arg;
  	int ret;

  	if (strcmp(param, "async_probe") == 0) {
-		if (kstrtobool(val, &mod->async_probe_requested))
-			mod->async_probe_requested = true;
+		if (kstrtobool(val, &async_probe_requested))
+			async_probe_requested = true;
+		mod->async_probe_requested = async_probe_requested ?
+						     PROBE_ASYNCHRONOUSLY :
+						     PROBE_SYNCHRONOUSLY;
  		return 0;
  	}


