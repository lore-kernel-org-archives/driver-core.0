Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17870339389
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746085; cv=none; b=KHgktjgAdg7AOrI/LwF5UZ9cOARMMdsZntyv8P7qbvmFjpPtx/TJEh3XBQJ//MIsxyPt+xvdsvt+Z9GgSzpGqxXnuN788Ks9FAWfkCWOMHp6J1H39jMuYA9S/6FgUzETHecs6lNd0fdHjg6OwFs10DcBup0cSXLXZ7xHZKp0nwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746085; c=relaxed/simple;
	bh=fXOnqMD1xqHcGsRi3JyByXdYvhXvQBlvf+f2a/k2AgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AW88da2ZIEN3ipMf8zVtyef0pDF7yInXGo+7i/LCoyDOIMDSaji74COmASDr8p/SaEZ9XLgD75chl/dmuJeledQ0AUnhjEwayuk2XvfJYm77hpAXa1kLqayahZgVgxqyvRmYZql+YNB4POykYufy8EhKy328EEwSFYJAfqncMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=B1ANlQdk; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="B1ANlQdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785746062;
	bh=xcWxLu93yMpyZxT0R7VYvO1LUeP3dCSaAZ9c92LcTRk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=B1ANlQdk1/tSoXBDcI2CpIqmc0wmarTQCWnVrOGEBgdZjJTkmtPEpk/ywLPhNGrrp
	 gljZZ5R7sur+IPKJFs8YwcjaN0hHjsMk+C/c+DFRh02wDRxT0ckSN/8e+5XXEo8gUe
	 uhMWBpfQkFScWBHqdnfQVaVfNRF9FNk4QkwNygn4=
X-QQ-mid: esmtpsz21t1785746043t475cbd7b
X-QQ-Originating-IP: xp4praOLf5u2eQICpW9EwBB7omJEKTFP29ew21R6qwY=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 16:34:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2044868169161866416
EX-QQ-RecipientCnt: 8
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: chenyichong@uniontech.com,
	dakr@kernel.org,
	djakov@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com,
	rafael@kernel.org
Subject: Re: [PATCH] debugfs: serialize debugfs_create_str() writers
Date: Mon,  3 Aug 2026 16:34:01 +0800
Message-Id: <20260803083401.819079-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2026080345-bucked-debunk-5b57@gregkh>
References: <2026080345-bucked-debunk-5b57@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NY3HYYTs4gYSl/WH5SkByg4DeCaqJJbIWBjjZ82gHPmnPKBN0QBAWYde
	4pE8vcYAFI8MpEsndkotyazI6s2NUXFeOEURuaVdX6hz6xDMQtAJZgLLOlsTRx03GlS6hwA
	FmOXcLGm/+TEj7k92DuzhlxWWNWedvZ7Msb95eZOhMDKuQfa1xNPncFk5CgJlY+WRTbalCw
	1ezqE2YdCWRUz3rA3ueNJL9ywqSZt1/fOpT6uWrx6lDKo3NMM0dICKVPD7OkjW48RBbYg8n
	zfCxbgRgYQaa8eUscJzmwTOj0Lc4ejwpE9m+HrGziVm2b+dsOjM9WrCZl6hWXDAy3ONTEns
	9oVQThoOZMms+zoNTeJy0/wYSyEI5o/z3q0SkkEUjDCzzI71LNC+9HYmC56uwuwT2DOr4Cq
	M5Deueq3HrOdwlZHR4WLU0O4B0oWhCN7LGkXiAZn0bjXDq9QgurOtBeXagPmljGqAaD5D2K
	DumQa+hETe0qZCARYlRmMy+wArH0R5aJOyTgJkqogxa0F1ee8pxwj/2DUMCA3z6HzIQzCA6
	9+WOspQFywpeug4Y1jKw3XBuinDNhl/cz3izzL6mJRg9u8AlDh/CubfSup3JmRv4ue0sV6v
	X37uHvjZ4JMdLBM4+N6lwt54hWVsd6vrIPyNEVIUMsMrGf5D8J09sL6qPcXPnDEG50VHlM2
	MVezJui1VGuRoNS+oJNWfoE2wuz6jHFcuBITyZpdfMGbMi5ArbDGHqFBexArbf3axkqAYMy
	zCe+xbliyfUlNbebFXl6cX0sVbg1YeWIKXpxtey926OmCzaxV6EYh6ZxIYcTBn+vor96YCX
	kL+MseOG9xTWmdJDwqrZ2lSh4q9G4dPsNxebknlCYMea1d/pmq344tUl97j06HKqWFvPR6e
	/RYUi9fIs9U7XqFO6AxakKyu9H2XtOE8jvWQjzgVMVmMn8TRsBCiiWve6S0XwwOcNMSfQsB
	tCyo5kBEvY4NkJzTYMZRzRerQ1arUZ2DRWJJJ4hu3zhbfQq8W95epeqm90Gp440e5Ie21Xg
	eKbrbDj6XUsvS+UnSO4xR8ZA733s52sJXn9wvwN7ZWRDNSF4W0
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Mon, Aug 03, 2026 at 08:19:05AM +0200, Greg KH wrote:
> Ouch, you are doing to serialize _all_ debugfs strings on one lock?
>
> This feels wrong :(
>
> Wait, why rcu if you have a lock?
>
> guard() is nicer.
>
> My larger question is, what code is broken because of this?  What
> debugfs string replacements are happening?  I hate the string debugfs
> code as it has had lots of issues like this over the years so maybe we
> should just drop it and force users to "roll their own" implementation
> that would be much simpler without the rcu/locking mess at all?

Thanks for the review.

The patch was trying to fix a double-free.  Two concurrent writes to the same
debugfs_create_str() file can both observe the same old pointer before
either replacement is published, and then both free that old string.  I
reproduced this with KASAN and got:

  BUG: KASAN: double-free in debugfs_write_file_str()

I agree with your comments that the current fix is not a good direction.  A
global mutex serializes unrelated debugfs string files, and mixing that with
the RCU read side makes the helper more complicated.

The directly writable in-tree users I found are:

  drivers/interconnect/debugfs-client.c:
    /sys/kernel/debug/interconnect/test_client/src_node, mode 0600
    /sys/kernel/debug/interconnect/test_client/dst_node, mode 0600

  drivers/soundwire/debugfs.c:
    firmware_file, mode 0200

So the write path is reachable through in-tree debugfs users, although I
do not know whether anyone relies on concurrent writes to these files in
practice.

I can rework this in a few ways:

  1. make the locking per-file instead of global, if we want to keep the
     generic writable string helper;

  2. drop the write support from debugfs_create_str() and convert the
     writable users to their own small file operations;

  3. take another direction if you have a preferred approach.

Dropping write support would avoid keeping this locking in the generic
helper, but debugfs_create_str() is exported, so that would also change
behavior for any out-of-tree users relying on writable strings.

Please let me know which direction you prefer.  If none of these options
looks worthwhile for debugfs, I am also fine with dropping this patch.

Thanks,
Yichong
