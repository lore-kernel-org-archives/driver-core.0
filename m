Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751714;
	b=cOkoFgznJvefymy/dgc5iW6B8WtTC2bNYcTMP2iFXTMaoBk5NYyADa9pSjPpToEOiYg/
	 5WhKmkrQHMZqolGGgfEns+0fzNDsq/hv3KQJVB9/HLrvGQnlNk5PREF/qnBaqPWKSBMf8
	 AoowG6QAMsuM1fBEUSfb27W/Awde6wLKOH4CWcrRwSGI7OqT686hzKd1Hz2zH3NhnZhTG
	 Fdhf0kfuI/+AKyb49o5Jc8fqzN++NYVYNL0gxAd/wlOCex6fBQiofkP6F7HgOp3DkmY5z
	 CUu/DDLHPIwPLUz/e3Gu8DE8ZcUE8BQfZqdW3v3dvBRijGNez5LJQ6d1AlX4TtW84Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k9LHe1k3JJHdATvv4AfPRU7gCDBKGLYt+F9m7byWzFQ=;
	b=4olLsqPgi4/putU4IcYcdpg1u0HD9Qj4uUvbh+LYH2HtEoqQXI2nBVycKvsJBZOs/BDe
	 K57EtX0NdjBix37wWGMv3j8lC5vuq17Hg+PnVQqCjjxAuw25232yAXYP7bMqNNNofYwV+
	 Ji+MoMHMHlNqh2bseWfuR7964VeO1nwAVyN6NNZBPFbTY+BlDQliWNXFKZIa+64Fy4M4S
	 H4/zIVJIUTgCG2KBAdUU4Dcg/GyVPUjNSqO44dWz3lQ9em7zxWZlKfUdIfDLoOLyCnir5
	 stFWfwjdkRIUrPg4rJjGYuajQIJGbAO82Eq/wBFDgJmtWeN7996ReBU4pPlhp6MqHQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RFcFG0rh;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F59606A322
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F59606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RFcFG0rh
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df8fe8513so640111f8f.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792751711; x=1793356511; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k9LHe1k3JJHdATvv4AfPRU7gCDBKGLYt+F9m7byWzFQ=;
        b=RFcFG0rh6jBHu8eFaFE7mhXCZIVEZOxUvPRbOOFM8xyfL5VzGzGE7LDpQPgfxqo71v
         nlJJ3ug5ubOsNhxqD9JoqF+9Py/RmqAdPhK7NdmNvixg8Z/SU9ZSGVQM1DeCZ7wmhQar
         N9gStXmWxK5RmxFX3ioLLbwXhVHFLNNrbNOtni4qC2WCMdqHz9COQkpO+wkG8niGoxKu
         Iwd835p71wqZr8YDnEJcuifHvduN1OTDQNWiVUmvok+uCZ5Lhzcw5EpihH2kEBEdEOhK
         EJricCAzM7Iq3Zmx1R9dk6uKGTKRYMDKwfNlUo2Wko4vb08XK+gOaxR7TXdGIHtA4O60
         dqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751711; x=1793356511;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k9LHe1k3JJHdATvv4AfPRU7gCDBKGLYt+F9m7byWzFQ=;
        b=kSOjHusyRWUilNyoAMjyiwZafiSjkKhk4wYwfPOr+Cg2bWgHmJhKFx9GJ+5PPGgN0k
         LaBgQNWbeLad00DGayJRFLRHYz251gz9aU+LZsIccvBGpcPpZqnAzudArz5dOkbiHZFO
         EWy6M5AXhOVG9KHRoTZmukT25u6bykgPcU6R6DOAdMx4EUDKP4DDV2wky0KhJsC0vaPO
         UG2hXAZjy7DA+ytQPhn1L4o0PKs8C1PnGkc5Juf3pI/R32es+sWK/azs3leAxaW4gSHb
         /KzjEgAv0JXSJZy/EoSjk3uDSyuhDSrQPYhZMHTXJg9MqvPpYZ5RhqBeQI1xNrmXWxzv
         c75A==
X-Forwarded-Encrypted: i=1; AKwUvBy0e0jplRjy+Ej3WfTNQYUVDtc1GsEZqRCglRPcbq7R/W8QNw8SH40MqPLAmxM7K8HivRT5zwvn83zR+A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLi4imOwZGvidZOqP6xg/Ylc77UGzQvUYSRDIFu/lBRvmxIcr+e
	FGaMZN6mnT7c+yAwLm4MY01xiLFT2FESbna8ZsYkcZIGEzldc/sZLua96AWF3k/UcFk=
X-Gm-Gg: AYBFou3osax19yWVdvGNOoOTVakyVyZm1F0gojVy6kMqj/G6y+7nfVqNqUlORdGsTCa
	8Z2yk0kdhuszGT8lt6sypd/ZJ+5tXKnZFgIp9Pm7vQcj1NUr1PAc+PvpL9/njpJCv20sGZaUeiU
	V740D+IBnDAiidzWtYNP98bEKoTJVsB08tsVhF3xY9V2AxXKZepm8ZceC97y87hQFYx84CTZCeG
	0WT99sxvqjBvPvS7G+8Fr1DpxD444NOFvbOZ+0FZPpLvo/KmLctT44N50+TQA+VlsYLx4aBEmMt
	CRvzLy4LFxbjEaNRp3jhdMtaNvk2QpWrxFdBCMhnZY/UF3XSg4TMV0TX1B1YJvxkX/lG1f4B8yA
	E/v4+T+fTi4YUMcZanTADc0qdWMKmMt8XtfWRfDVZiPoSo4VInq5oclodz4tbj0QoTMorDD9wFu
	KCkC8d+WFWh9Pu3Dq7qrukN6Ap8pRk4UzBwtK9JWTzHGin1g5/XXI7VT0ukAulTI04F7iW2UMIB
	WXMm1CMY8T1pd+fVMjFt7DPxxRDX7LzjDoNliYyMsMKL70bF7HrrrzHDSlwFGPhyyInl7TyDmM=
X-Received: by 2002:a05:6000:178f:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e385af884mr2851431f8f.40.1792751710619;
        Fri, 23 Oct 2026 03:35:10 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380636bcsm4189796f8f.58.2026.10.23.03.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:35:10 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 01/16] clk: Propagate rate programming failures
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:35:03 +0200
Message-Id: <179275170360.4070168.921683102015750189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12419; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9ddwNc90aouSZs62t2T/GwcdDeP+ivazP5j0kqFYglo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFm3LaK2Bbtq1t9e//7ihSt7b5XNP8h07on3N82tovl3n
 ln1+DpGdpSyMIhxMciKKbLUcFeLv5PU+jJrus5tmDmsTCBDGLg4BWAi2z0ZGc6tNFu1lGHjdO+H
 RYIRH2vSzCRXX3iyVMvgfLzlxlmrunwZ/lm/eafgdjCP98sn3itXFHf/zddf8DJz0eomD04tyRf
 NPkwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The clock rate-change walk ignores runtime PM, temporary prepare and
> enable, and provider programming failures. clk_set_rate() can therefore
> report success after a provider rejected the operation, while later
> clocks in the affected tree continue to be programmed. Consumers can
> then proceed with a configuration that was never successfully applied.
> 
> A failed parent switch must not leave the software topology pointing at
> the rejected source or release the old parent's references. Likewise,
> rate notifiers must not announce success before the whole walk succeeds,
> or lose their ABORT notification when a PRE notifier vetoes the change.
> 
> Propagate errors and stop the walk at the first failure. Keep topology,
> temporary references, and terminal notifications consistent with the
> outcome.

I agree with the need and direction of this change in general.
I was actually trying out some ideas for the framework and stumbled on
the same problem.

https://github.com/jbrun3t/linux/commit/c5de3ef09e6d38efc5d930befbe155eaca07884b

Your change covers a few cases I missed but duplicates a bit of code.
I'm sure we can work something out :)

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/clk.c      | 163 +++++++++++++++++++++++++++++++++++++------------
>  drivers/clk/clk_test.c |  16 ++++-
>  2 files changed, 138 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d2cc86bfbeb..95669775f8cd 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -84,6 +84,7 @@ struct clk_parent_map {
>   *                     clk_core->rate every time the clock is reparented, and
>   *                     when we're doing the orphan -> !orphan transition.
>   * @new_rate:          New rate to be set during a rate change operation.
> + * @old_rate:          Rate before the current rate change operation.
>   * @new_parent:        Pointer to new parent during parent change. This is also
>   *                     used when a clk's rate is changed.
>   * @new_child:         Pointer to new child during reparenting. This is also
> @@ -130,6 +131,7 @@ struct clk_core {
>  	unsigned long		rate;
>  	unsigned long		req_rate;
>  	unsigned long		new_rate;
> +	unsigned long		old_rate;
>  	struct clk_core		*new_parent;
>  	struct clk_core		*new_child;
>  	unsigned long		flags;
> @@ -2163,11 +2165,14 @@ static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
>  	core->parent = new_parent;
>  }
>  
> -static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> -					   struct clk_core *parent)
> +static int __clk_set_parent_before(struct clk_core *core,
> +				   struct clk_core *parent,
> +				   struct clk_core **old_parent)
>  {
>  	unsigned long flags;
> -	struct clk_core *old_parent = core->parent;
> +	int ret;
> +
> +	*old_parent = core->parent;
>  
>  	/*
>  	 * 1. enable parents for CLK_OPS_PARENT_ENABLE clock
> @@ -2191,14 +2196,24 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *core,
>  
>  	/* enable old_parent & parent if CLK_OPS_PARENT_ENABLE is set */
>  	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> -		clk_core_prepare_enable(old_parent);
> -		clk_core_prepare_enable(parent);
> +		ret = clk_core_prepare_enable(*old_parent);
> +		if (ret)
> +			return ret;
> +
> +		ret = clk_core_prepare_enable(parent);
> +		if (ret)
> +			goto disable_old_parent;
>  	}
>  
>  	/* migrate prepare count if > 0 */
>  	if (core->prepare_count) {
> -		clk_core_prepare_enable(parent);
> -		clk_core_enable_lock(core);
> +		ret = clk_core_prepare_enable(parent);
> +		if (ret)
> +			goto disable_ops_parents;
> +
> +		ret = clk_core_enable_lock(core);
> +		if (ret)
> +			goto disable_migration_parent;
>  	}
>  
>  	/* update the clk tree topology */
> @@ -2206,7 +2221,18 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *core,
>  	clk_reparent(core, parent);
>  	clk_enable_unlock(flags);
>  
> -	return old_parent;
> +	return 0;
> +
> +disable_migration_parent:
> +	clk_core_disable_unprepare(parent);
> +disable_ops_parents:
> +	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		clk_core_disable_unprepare(parent);
> +disable_old_parent:
> +	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		clk_core_disable_unprepare(*old_parent);
> +
> +	return ret;
>  }
>  
>  static void __clk_set_parent_after(struct clk_core *core,
> @@ -2232,11 +2258,12 @@ static void __clk_set_parent_after(struct clk_core *core,
>  static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>  			    u8 p_index)
>  {
> -	unsigned long flags;
>  	int ret = 0;
>  	struct clk_core *old_parent;
>  
> -	old_parent = __clk_set_parent_before(core, parent);
> +	ret = __clk_set_parent_before(core, parent, &old_parent);
> +	if (ret)
> +		return ret;
>  
>  	trace_clk_set_parent(core, parent);
>  
> @@ -2247,10 +2274,10 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>  	trace_clk_set_parent_complete(core, parent);
>  
>  	if (ret) {
> -		flags = clk_enable_lock();
> +		unsigned long flags = clk_enable_lock();
> +
>  		clk_reparent(core, old_parent);
>  		clk_enable_unlock(flags);
> -
>  		__clk_set_parent_after(core, old_parent, parent);
>  
>  		return ret;
> @@ -2312,6 +2339,7 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
>  	struct clk_core *child;
>  
>  	core->new_rate = new_rate;
> +	core->old_rate = core->rate;
>  	core->new_parent = new_parent;
>  	core->new_parent_index = p_index;
>  	/* include clk in new parent's PRE_RATE_CHANGE notifications */
> @@ -2420,13 +2448,20 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
>  						  unsigned long event)
>  {
>  	struct clk_core *child, *tmp_clk, *fail_clk = NULL;
> +	unsigned long old_rate = core->rate;
> +	unsigned long new_rate = core->new_rate;
>  	int ret = NOTIFY_DONE;
>  
> -	if (core->rate == core->new_rate)
> +	if (event != PRE_RATE_CHANGE)
> +		old_rate = core->old_rate;
> +	if (event == POST_RATE_CHANGE)
> +		new_rate = core->rate;
> +
> +	if (old_rate == new_rate)
>  		return NULL;
>  
>  	if (core->notifier_count) {
> -		ret = __clk_notify(core, event, core->rate, core->new_rate);
> +		ret = __clk_notify(core, event, old_rate, new_rate);
>  		if (ret & NOTIFY_STOP_MASK)
>  			fail_clk = core;
>  	}
> @@ -2454,17 +2489,17 @@ static struct clk_core *clk_propagate_rate_change(struct clk_core *core,
>   * walk down a subtree and set the new rates notifying the rate
>   * change on the way
>   */
> -static void clk_change_rate(struct clk_core *core)
> +static int clk_change_rate(struct clk_core *core)
>  {
>  	struct clk_core *child;
>  	struct hlist_node *tmp;
> -	unsigned long old_rate;
>  	unsigned long best_parent_rate = 0;
>  	bool skip_set_rate = false;
> -	struct clk_core *old_parent;
> +	bool rate_ungated = false;
> +	bool parent_enabled = false;
> +	struct clk_core *old_parent = NULL;
>  	struct clk_core *parent = NULL;
> -
> -	old_rate = core->rate;
> +	int ret = 0;
>  
>  	if (core->new_parent) {
>  		parent = core->new_parent;
> @@ -2474,53 +2509,83 @@ static void clk_change_rate(struct clk_core *core)
>  		best_parent_rate = core->parent->rate;
>  	}
>  
> -	if (clk_pm_runtime_get(core))
> -		return;
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		return ret;
>  
>  	if (core->flags & CLK_SET_RATE_UNGATE) {
> -		clk_core_prepare(core);
> -		clk_core_enable_lock(core);
> +		ret = clk_core_prepare(core);
> +		if (ret)
> +			goto runtime_put;
> +
> +		ret = clk_core_enable_lock(core);
> +		if (ret) {
> +			clk_core_unprepare(core);
> +			goto runtime_put;
> +		}
> +		rate_ungated = true;
>  	}
>  
>  	if (core->new_parent && core->new_parent != core->parent) {
> -		old_parent = __clk_set_parent_before(core, core->new_parent);
> +		ret = __clk_set_parent_before(core, core->new_parent,
> +					      &old_parent);
> +		if (ret)
> +			goto cleanup;
>  		trace_clk_set_parent(core, core->new_parent);
>  
>  		if (core->ops->set_rate_and_parent) {
>  			skip_set_rate = true;
> -			core->ops->set_rate_and_parent(core->hw, core->new_rate,
> +			ret = core->ops->set_rate_and_parent(core->hw, core->new_rate,
>  					best_parent_rate,
>  					core->new_parent_index);
>  		} else if (core->ops->set_parent) {
> -			core->ops->set_parent(core->hw, core->new_parent_index);
> +			ret = core->ops->set_parent(core->hw,
> +						    core->new_parent_index);
>  		}
>  
>  		trace_clk_set_parent_complete(core, core->new_parent);
> -		__clk_set_parent_after(core, core->new_parent, old_parent);
> +		if (ret) {
> +			unsigned long flags = clk_enable_lock();
> +
> +			clk_reparent(core, old_parent);
> +			clk_enable_unlock(flags);
> +			__clk_set_parent_after(core, old_parent,
> +					       core->new_parent);
> +			goto cleanup;
> +		}

This is the rollback of __clk_set_parent() again. clk_change_rate() has
its own copy of the parent switch, which is how the error handling got
lost in the first place. I'd rather have clk_change_rate() call
__clk_set_parent() so there is one place to get right.

> +
> +		__clk_set_parent_after(core, core->new_parent,
> +				       old_parent);
>  	}
>  
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> -		clk_core_prepare_enable(parent);
> +	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +		ret = clk_core_prepare_enable(parent);
> +		if (ret)
> +			goto cleanup;
> +		parent_enabled = true;
> +	}
>  
>  	trace_clk_set_rate(core, core->new_rate);
>  
>  	if (!skip_set_rate && core->ops->set_rate)
> -		core->ops->set_rate(core->hw, core->new_rate, best_parent_rate);
> +		ret = core->ops->set_rate(core->hw, core->new_rate,
> +					  best_parent_rate);
>  
>  	trace_clk_set_rate_complete(core, core->new_rate);
>  
>  	core->rate = clk_recalc(core, best_parent_rate);
>  
> -	if (core->flags & CLK_SET_RATE_UNGATE) {
> +cleanup:
> +	if (rate_ungated) {
>  		clk_core_disable_lock(core);
>  		clk_core_unprepare(core);
>  	}
>  
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +	if (parent_enabled)
>  		clk_core_disable_unprepare(parent);
>  
> -	if (core->notifier_count && old_rate != core->rate)
> -		__clk_notify(core, POST_RATE_CHANGE, old_rate, core->rate);
> +	if (ret)
> +		goto runtime_put;
>  
>  	if (core->flags & CLK_RECALC_NEW_RATES)
>  		(void)clk_calc_new_rates(core, core->new_rate);
> @@ -2533,14 +2598,22 @@ static void clk_change_rate(struct clk_core *core)
>  		/* Skip children who will be reparented to another clock */
>  		if (child->new_parent && child->new_parent != core)
>  			continue;
> -		clk_change_rate(child);
> +		ret = clk_change_rate(child);
> +		if (ret)
> +			goto runtime_put;
>  	}
>  
>  	/* handle the new child who might not be in core->children yet */
> -	if (core->new_child)
> -		clk_change_rate(core->new_child);
> +	if (core->new_child) {
> +		ret = clk_change_rate(core->new_child);
> +		if (ret)
> +			goto runtime_put;
> +	}
>  
> +runtime_put:
>  	clk_pm_runtime_put(core);
> +
> +	return ret;
>  }
>  
>  static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
> @@ -2613,7 +2686,14 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
>  	}
>  
>  	/* change the rates */
> -	clk_change_rate(top);
> +	ret = clk_change_rate(top);
> +	if (ret) {
> +		__clk_recalc_rates(top, true, 0);

update_req = true sets req_rate to the current rate for top and every
clock below it. Those clocks did not ask for that rate, and a later
range change would take them back to it. Please don't touch req_rate
on failure.

> +		clk_propagate_rate_change(top, ABORT_RATE_CHANGE);

The walk stops at the first failure, but by then some clocks have been
programmed, and the clocks below them are dragged along. They all get
ABORT_RATE_CHANGE although their rate did change. The clocks after the
failure also miss their set_rate(), although their parent moved. I
think the walk should carry on with the siblings of the failing clock,
and a notifier should be told what really happened: POST when the rate
changed, ABORT when it did not.

-- 
Jerome

