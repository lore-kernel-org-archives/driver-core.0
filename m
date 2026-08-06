Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C422D7A9;
	Thu,  6 Aug 2026 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786056525; cv=none; b=aauCNx6XfcXc0UnNPSxHpzMOSwCwqOgYXHwwT5Ra2kxq29qMyQONNMj7fmygOur/k/dS1gb/PHoPSFvcpU+FLj90K2ohTuqdsAorPljEWezm5EB3efcTXNESp/CWfzUHtrAFAyjezOfiBmMVrI1Wbzrr7VuWfJ6TOdi8YG2AdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786056525; c=relaxed/simple;
	bh=47MhhO47gY+JH2sPUWtshEZPSr4hnFXUniWpt+7sZ4E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gwS22U1XR5zMyqzwqeh4UPXX/LhbHcVEA8+hBuvNbQNntlhmmlwlsfLZCCn4wv7oootusPzHlI3v2L0905+PEdNKtIJ9Y0lLu1ZQQJnSPXliaZuLT0dxkOmXC7fh8y77FocAZ1a6mYDBElzMcu7MpA3d2iYPj+OfyyH09hrKk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y/hkOxsi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y/hkOxsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CFC1F000E9;
	Thu,  6 Aug 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786056524;
	bh=aKWps21C2vpIWj/xL3lTP3KBe8XdUi+jDN1FX8vkfyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y/hkOxsiIyXqvny+I6euy/SH9J9Y7PfvaVvzz4ktCdEuX4pKj6zPoGgBWZ5XftV5k
	 TJfDirsMpGdI8gmczhDD0jw9OYPO5/iIRZkpzwjANRXqfSxsf443+QOpy/gnslQp/t
	 soLmaACg6qvULyVpdT1asWMzpnJCBRCNU+SfzJlM=
Date: Thu, 6 Aug 2026 15:48:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, David Hildenbrand <david@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Liam R. Howlett" <liam@infradead.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon
 <will@kernel.org>, driver-core@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-Id: <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 06 Aug 2026 09:58:38 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
> 
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
> 
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.

Unclear what tree this is targeted at.  I grabbed it.


mm-stable does have this change:

--- linux-7.2-rc5/drivers/base/arch_numa.c	2026-07-27 04:44:55.000000000 -0700
+++ 25/drivers/base/arch_numa.c	2026-08-06 15:47:59.019918702 -0700
@@ -231,10 +231,6 @@ static int __init numa_init(int (*init_f
 {
 	int ret;
 
-	nodes_clear(numa_nodes_parsed);
-	nodes_clear(node_possible_map);
-	nodes_clear(node_online_map);
-
 	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
 	if (ret < 0)
 		goto out_free_distance;


which is easily handled either way.
